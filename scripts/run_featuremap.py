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
import lib.rle.coding
import lib.apbm.coding

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

    # get datatype
    if args.bitwidth == 8:
        dtype = lib.quantise.sint8
    if args.bitwidth == 16:
        dtype = lib.quantise.sint16
    if args.bitwidth == 32:
        dtype = lib.quantise.sint32

    # parse arguments
    args = parser.parse_args()

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

    def run_apbm(stream_in, layer):
        code_table = lib.apbm.coding.get_code_table(copy.deepcopy(stream_in))
        return lib.apbm.coding.encoder(stream_in, code_table=code_table)

    def run_abe(stream_in, layer):
        return lib.abe.coding.encoder(stream_in,window_size=32)

    def run_rle(stream_in, layer):
        return lib.rle.coding.encoder(stream_in)
   
    # encoders to run
    encoders = {
        "baseline"  : run_baseline,
        "bi"        : run_bi,
        "dsam"      : run_dsam,
        "apbm"      : run_apbm,
        "abe"       : run_abe,
        "rle"       : run_rle
    }

    # list of metrics for each layer
    metrics = []

    # iterate over layers in featuremap
    for layer in layers:

        # add layer to outputs
        layer_metrics = { layer : [] }

        # load feature map
        featuremap = lib.featuremap.to_stream(args.featuremap_path, layer, limit=args.limit, dtype=dtype)
      
        # iterate over encoders
        for encoder in encoders:

            print("{}: \t running {}".format(layer,encoder))

            # get the stream out
            stream_out = encoders[encoder](copy.deepcopy(featuremap), layer)

            # get all the metrics
            layer_metrics[layer].append({
                encoder : {
                    "bitwise_mean"          : lib.analysis.bitwise_mean(stream_out).astype(float).tolist(),
                    "bitwise_variance"      : lib.analysis.bitwise_variance(stream_out).astype(float).tolist(),
                    "total_transitions"     : lib.analysis.total_transitions(stream_out).astype(float),
                    "average_sa"            : lib.analysis.average_switching_activity(stream_out).astype(float),
                    "average_sa_per_line"   : lib.analysis.average_switching_activity_per_line(stream_out).astype(float).tolist()
                }
            })

        # append layer metrics to all metrics
        metrics.append(layer_metrics)

    # save output 
    with open(os.path.join(args.output_path,"output_metrics.json"),"w") as f:
        json.dump(metrics, f, indent=4)
