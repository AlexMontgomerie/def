import argparse
import copy
import json
import os
import numpy as np

import lib.stream
import lib.analysis
import lib.featuremap
import lib.quantise

import lib.coding
import lib.bi.coding
import lib.dsam.coding
import lib.abe.coding
import lib.awr.coding
import lib.rle.coding
import lib.rle_dsam.coding
import lib.huffman.coding
import lib.apbm.coding

if __name__ == "__main__":

    # setup argument parser
    parser = argparse.ArgumentParser(description="Feature map encoding script (Multi channel)")
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

    # get all the layers
    layers = lib.featuremap.get_layers( args.featuremap_path )

    # get all dimensions
    dimensions = lib.featuremap.get_dimensions( args.featuremap_path )

    def run_baseline(stream_in, layer):
        return lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()

    def run_bi(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=56).single_stream()
        return lib.bi.coding.encoder(stream_in)

    def run_dsam_serial(stream_in, layer):
        channels = dimensions[layer][1]
        stream_in = lib.dsam.coding.encoder(stream_in, channels=channels, use_correlator=False)
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        return lib.coding.correlator(stream_in)

    def run_dsam_parallel(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64)
        channels = dimensions[layer][1]
        if channels%stream_in.n_channels:
            print("ERR: cannot parallise stream")
            return stream_in.single_stream()
        for i in range(stream_in.n_channels):
            stream_in.streams[i] = lib.dsam.coding.encoder(stream_in.streams[i], channels=int(channels/stream_in.n_channels))
        return stream_in.single_stream() 

    def run_apbm(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        code_table_stream =copy.deepcopy(stream_in)
        code_table_stream.arr = np.random.choice(code_table_stream.arr, int(args.limit/20))
        code_table = lib.apbm.coding.get_code_table(code_table_stream)
        return lib.apbm.coding.encoder(stream_in, code_table=code_table)

    def run_abe(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=56).single_stream()
        return lib.abe.coding.encoder(stream_in,window_size=32)

    def run_awr(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=56).single_stream()
        return lib.awr.coding.encoder(stream_in,N=8)

    def run_huffman(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        code_table = lib.huffman.coding.get_code_table(copy.deepcopy(stream_in))
        return lib.huffman.coding.encoder(stream_in, code_table)

    def run_huffman_bi(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        code_table = lib.huffman.coding.get_code_table(copy.deepcopy(stream_in))
        huffman_stream = lib.huffman.coding.encoder(stream_in, code_table)
        return lib.bi.coding.encoder(huffman_stream)

    def run_rle(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        return lib.rle.coding.encoder(stream_in)
 
    def run_rle_bi(stream_in, layer):
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        rle_stream = lib.rle.coding.encoder(stream_in)
        return lib.bi.coding.encoder(rle_stream)
 
    def run_rle_dsam_serial(stream_in, layer):
        channels = dimensions[layer][1]
        stream_in = lib.rle_dsam.coding.encoder(stream_in, channels=channels, use_correlator=False)
        stream_in = lib.stream.multi_stream(stream_in,dtype=dtype,memory_bus_width=64).single_stream()
        return lib.coding.correlator(stream_in)

  
    # encoders to run
    encoders = {
        "baseline"      : run_baseline,
        "bi"            : run_bi,
        "dsam"          : run_dsam_serial,
        "apbm"          : run_apbm,
        "abe"           : run_abe,
        "awr"           : run_awr,
        "huffman"       : run_huffman,
        "huffman_bi"    : run_huffman_bi,
        "rle"           : run_rle,
        "rle_bi"        : run_rle_bi,
        "rle_dsam"      : run_rle_dsam_serial
    }

    # list of metrics for each layer
    metrics = {} 

    # iterate over layers in featuremap
    for layer in layers:

        # add layer to outputs
        metrics[layer] = {}

        # load feature map
        featuremap = lib.featuremap.to_stream(args.featuremap_path, layer, limit=args.limit, dtype=dtype)
     
        # convert to multi stream

        # iterate over encoders
        for encoder in encoders:

            print("{}: \t running {}".format(layer,encoder))

            # get the stream out
            stream_out = encoders[encoder](copy.deepcopy(featuremap), layer)

            # get all the metrics
            metrics[layer][encoder] = {
                "bitwidth"                      : 64,
                "bitwise_mean"                  : lib.analysis.bitwise_mean(stream_out).astype(float).tolist(),
                "bitwise_variance"              : lib.analysis.bitwise_variance(stream_out).astype(float).tolist(),
                "total_transitions"             : lib.analysis.total_transitions(stream_out).astype(float),
                "total_transitions_per_line"    : lib.analysis.total_transitions_per_line(stream_out).astype(float).tolist(),
                "total_samples"                 : lib.analysis.total_samples(stream_out),
                "average_sa"                    : lib.analysis.average_switching_activity(stream_out,bitwidth=64).astype(float),
                "average_sa_per_line"           : lib.analysis.average_switching_activity_per_line(stream_out).astype(float).tolist()
            }
        
    # save output 
    with open(os.path.join(args.output_path,"output_metrics.json"),"w") as f:
        json.dump(metrics, f, indent=4)
