import argparse
import copy
import json
import os

import lib.stream
import lib.analysis
import lib.featuremap
import lib.quantise

import lib.bi.coding
import lib.dsam.coding
import lib.abe.coding
import lib.awr.coding
import lib.rle.coding
import lib.rle_dsam.coding
import lib.huffman.coding
import lib.apbm.coding

ABE_N = 32
AWR_N = 4

if __name__ == "__main__":

    # setup argument parser
    parser = argparse.ArgumentParser(description="Feature map encoding script")
    parser.add_argument('-n','--name', type=str, default="network", help='Name of network')
    parser.add_argument('-f','--featuremap_path',metavar='PATH',required=True,
        help='Path to feature map file (.h5)')
    parser.add_argument('-o','--output_path',metavar='PATH',required=True,
        help='Path for output (.json)')
    parser.add_argument('-l','--limit',metavar='N',type=int,default=100000,
        help='Limit on stream samples')
    parser.add_argument('-b','--bitwidth',metavar='N',type=int,default=8,
        help='Bitwidth of samples')

    # parse arguments
    args = parser.parse_args()

    # get datatype
    if args.bitwidth == 8:
        dtype = lib.quantise.sint8
    if args.bitwidth == 16:
        dtype = lib.quantise.sint16
    if args.bitwidth == 32:
        dtype = lib.quantise.sint32
    if args.bitwidth == 64:
        dtype = lib.quantise.sint64

    # get all the layers
    layers = lib.featuremap.get_layers( args.featuremap_path )

    # get all dimensions
    dimensions = lib.featuremap.get_dimensions( args.featuremap_path )

    def run_baseline(stream_in, layer):
        return stream_in

    def run_bi(stream_in, layer):
        return lib.bi.coding.encoder(stream_in)

    def run_dsam(stream_in, layer):
        channels = dimensions[layer][1]
        return lib.dsam.coding.encoder(stream_in, channels=channels)

    def run_dsam_rle(stream_in, layer):
        channels = dimensions[layer][1]
        dsam_stream = lib.dsam.coding.encoder(stream_in, channels=channels)
        return lib.rle.coding.encoder(dsam_stream)

    def run_dsam_bi(stream_in, layer):
        channels = dimensions[layer][1]
        dsam_stream = lib.dsam.coding.encoder(stream_in, channels=channels)
        return lib.bi.coding.encoder(dsam_stream)

    def run_apbm(stream_in, layer):
        code_table = lib.apbm.coding.get_code_table(copy.deepcopy(stream_in))
        return lib.apbm.coding.encoder(stream_in, code_table=code_table)

    def run_abe(stream_in, layer):
        return lib.abe.coding.encoder(stream_in,window_size=ABE_N)

    def run_awr(stream_in, layer):
        return lib.awr.coding.encoder(stream_in,N=AWR_N)

    def run_huffman(stream_in, layer):
        code_table = lib.huffman.coding.get_code_table(copy.deepcopy(stream_in))
        return lib.huffman.coding.encoder(stream_in, code_table)

    def run_huffman_bi(stream_in, layer):
        code_table = lib.huffman.coding.get_code_table(copy.deepcopy(stream_in))
        huffman_stream = lib.huffman.coding.encoder(stream_in, code_table)
        return lib.bi.coding.encoder(huffman_stream)

    def run_rle(stream_in, layer):
        return lib.rle.coding.encoder(stream_in)
 
    def run_rle_bi(stream_in, layer):
        rle_stream = lib.rle.coding.encoder(stream_in)
        return lib.bi.coding.encoder(rle_stream)
 
    def run_rle_dsam(stream_in, layer):
        channels = dimensions[layer][1]
        return lib.rle_dsam.coding.encoder(stream_in,channels=channels)
   
    # encoders to run
    encoders = {
        "baseline"  : run_baseline,
        "bi"        : run_bi,
        "dsam"      : run_dsam,
        "dsam_rle"  : run_dsam_rle,
        "dsam_bi"   : run_dsam_bi,
        "apbm"      : run_apbm,
        "abe"       : run_abe,
        "awr"       : run_awr,
        "huffman"   : run_huffman,
        "huffman_bi": run_huffman_bi,
        "rle"       : run_rle,
        "rle_bi"    : run_rle_bi,
        "rle_dsam"  : run_rle_dsam
    }

    # list of metrics for each layer
    metrics = {} 

    # iterate over layers in featuremap
    for layer in layers:

        # add layer to outputs
        metrics[layer] = {}

        # load feature map
        featuremap = lib.featuremap.to_stream(args.featuremap_path, layer, limit=args.limit, dtype=dtype)
      
        # iterate over encoders
        for encoder in encoders:

            print("{}: \t running {}".format(layer,encoder))

            # get the stream out
            stream_out = encoders[encoder](copy.deepcopy(featuremap), layer)

            # get all the metrics
            metrics[layer][encoder] = {
                "bitwise_mean"                  : lib.analysis.bitwise_mean(stream_out).astype(float).tolist(),
                "bitwise_variance"              : lib.analysis.bitwise_variance(stream_out).astype(float).tolist(),
                "total_transitions"             : lib.analysis.total_transitions(stream_out).astype(float),
                "total_transitions_per_line"    : lib.analysis.total_transitions_per_line(stream_out).astype(float).tolist(),
                "total_samples"                 : lib.analysis.total_samples(stream_out),
                "average_sa"                    : lib.analysis.average_switching_activity(stream_out).astype(float),
                "average_sa_per_line"           : lib.analysis.average_switching_activity_per_line(stream_out).astype(float).tolist()
            }
        
    # save output 
    with open(os.path.join(args.output_path,"output_metrics.json"),"w") as f:
        json.dump(metrics, f, indent=4)
