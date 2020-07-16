import argparse
import copy
import json
import os
import numpy as np
from scipy import stats
import math
from tqdm import tqdm
import functools

import lib.stream
import lib.analysis
import lib.featuremap

import lib.bi.coding
import lib.deaf.coding
import lib.abe.coding
import lib.awr.coding
import lib.rle.coding
import lib.rle_deaf.coding
import lib.huffman.coding
import lib.apbm.coding

ABE_N = 32
AWR_N = 4

SAMPLES_PERCENTAGE=0.05

MAX_ITER=5

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
    parser.add_argument('-s','--save_bin',action='store_true',
        help='Save to bin file')

    # parse arguments
    args = parser.parse_args()

    # get all the layers
    layers = lib.featuremap.get_layers( args.featuremap_path )

    # get all dimensions
    dimensions = lib.featuremap.get_dimensions( args.featuremap_path )

    def run_baseline(stream_in, layer):
        return stream_in, [0,0]

    def run_bi(stream_in, layer):
        return lib.bi.coding.encoder(stream_in), [0,0]

    def run_deaf(stream_in, layer):
        channels = dimensions[layer][1]
        return lib.deaf.coding.encoder(stream_in, channels=channels), [channels*stream_in.bitwidth, 0]

    def run_deaf_rle(stream_in, layer):
        channels = dimensions[layer][1]
        deaf_stream = lib.deaf.coding.encoder(stream_in, channels=channels, use_correlator=False)
        rle_stream = lib.rle.coding.encoder(deaf_stream,rle_zero=0)
        return lib.coding.correlator(rle_stream), [channels*stream_in.bitwidth, 0]
    
    def run_deaf_bi(stream_in, layer):
        channels = dimensions[layer][1]
        deaf_stream = lib.deaf.coding.encoder(stream_in, channels=channels)
        return lib.bi.coding.encoder(deaf_stream), [channels*stream_in.bitwidth, 0]

    def run_apbm(stream_in, layer):
        code_table_stream =copy.deepcopy(stream_in)
        code_table_stream.arr = np.random.choice(code_table_stream.arr, int(args.limit*SAMPLES_PERCENTAGE))
        code_table = lib.apbm.coding.get_code_table(code_table_stream)
        return lib.apbm.coding.encoder(stream_in, code_table=code_table), [len(code_table.keys())*stream_in.bitwidth,0]

    def run_abe(stream_in, layer):
        return lib.abe.coding.encoder(stream_in,window_size=ABE_N), [ABE_N*stream_in.bitwidth,0]

    def run_awr(stream_in, layer):
        return lib.awr.coding.encoder(stream_in,N=AWR_N), [AWR_N,0]

    def run_huffman(stream_in, layer):
        code_table_stream =copy.deepcopy(stream_in)
        code_table_stream.arr = np.random.choice(code_table_stream.arr, int(args.limit*SAMPLES_PERCENTAGE))
        code_table = lib.huffman.coding.get_code_table(code_table_stream)
        code_table_size = np.sum([ code_table._table[key][0] for key in code_table._table ])
        return lib.huffman.coding.encoder(stream_in, code_table), [code_table_size,0]

    def run_huffman_bi(stream_in, layer):
        code_table_stream =copy.deepcopy(stream_in)
        code_table_stream.arr = np.random.choice(code_table_stream.arr, int(args.limit*SAMPLES_PERCENTAGE))
        code_table = lib.huffman.coding.get_code_table(code_table_stream)
        code_table_size = np.sum([ code_table._table[key][0] for key in code_table._table ])
        huffman_stream = lib.huffman.coding.encoder(stream_in, code_table)
        return lib.bi.coding.encoder(huffman_stream), [code_table_size,0]

    def run_rle(stream_in, layer):
        rle_zero = stats.mode(stream_in.arr).mode[0]
        return lib.rle.coding.encoder(stream_in,rle_zero=rle_zero), [0,0]
 
    def run_rle_bi(stream_in, layer):
        rle_zero = stats.mode(stream_in.arr).mode[0]
        rle_stream = lib.rle.coding.encoder(stream_in,rle_zero=rle_zero)
        return lib.bi.coding.encoder(rle_stream), [0,0]
 
    def run_rle_deaf(stream_in, layer):
        channels = dimensions[layer][1]
        rle_zero = stats.mode(stream_in.arr).mode[0]
        return lib.rle_deaf.coding.encoder(stream_in,channels=channels,rle_zero=rle_zero), [channels*stream_in.bitwidth, 0]
   
    # encoders to run
    encoders = {
        "baseline"  : run_baseline,
        "bi"        : run_bi,
        "deaf"      : run_deaf,
        "apbm"      : run_apbm,
        "abe"       : run_abe,
        "awr"       : run_awr,
        "huffman"   : run_huffman,
        "rle"       : run_rle,
        "deaf_rle"  : run_deaf_rle,
        #"huffman_bi": run_huffman_bi,
        #"deaf_bi"   : run_deaf_bi,
        #"rle_bi"    : run_rle_bi,
        #"rle_deaf"  : run_rle_deaf
    }

    # list of metrics for each layer
    metrics = {} 

    # iterate over layers in featuremap
    for layer in layers:

        # add layer to outputs
        metrics[layer] = {}

        # load feature map
        featuremap = lib.featuremap.to_stream(args.featuremap_path, layer, bitwidth=args.bitwidth)

        # iterate over encoders
        for encoder in encoders:
            
            # initialise metrics for encoding scheme
            metrics[layer][encoder] = {
                "bitwidth"          : 0,
                "resources"         : 0,
                "total_transitions" : 0,
                "total_samples"     : 0,
                "average_sa"        : 0
                    
            }

            # get folded dimension
            stream_length = functools.reduce(lambda a,b : a*b, dimensions[layer])
                
            if args.save_bin:
                # clean binary file
                with open(os.path.join(args.output_path,"{}{}.bin".format(encoder,layers.index(layer))),"w") as f:
                    f.write("")

            # iterate over each n_limit section
            n_sections = min(MAX_ITER,math.floor(stream_length/args.limit))
            for i in tqdm(range(n_sections),ncols=150,desc="({})\t running {}".format(layer,encoder)):
 
                # create stream in
                stream_in = lib.stream.stream(featuremap[(i*args.limit):((i+1)*args.limit-1)], args.bitwidth)
                
                # get the stream out
                stream_out, resources = encoders[encoder](copy.deepcopy(stream_in), layer)

                # save to binary file
                if args.save_bin:
                    stream_out.to_bin(os.path.join(args.output_path,"{}{}.bin".format(encoder,layers.index(layer))))

                # update metrics
                metrics[layer][encoder]["bitwidth"]             = int(stream_out.bitwidth + stream_out.sc_width)
                metrics[layer][encoder]["resources"]            += int(resources[0])/n_sections
                metrics[layer][encoder]["total_transitions"]    += lib.analysis.total_transitions(stream_out).astype(float)
                metrics[layer][encoder]["total_samples"]        += lib.analysis.total_samples(stream_out)
                metrics[layer][encoder]["average_sa"]           += lib.analysis.average_switching_activity(stream_out).astype(float)/n_sections

    # save output 
    with open(os.path.join(args.output_path,"output_metrics.json"),"w") as f:
        json.dump(metrics, f, indent=4)
