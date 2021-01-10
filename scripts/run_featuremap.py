import argparse
import copy
import json
import os
import numpy as np
from scipy import stats
import math
from tqdm import tqdm
import functools
import random

import lib.stream
import lib.analysis
import lib.featuremap

import lib.ABE.coding
import lib.AWR.coding
import lib.BI.coding
import lib.DEF.coding
import lib.Huffman.coding
import lib.PBM.coding
import lib.RLE.coding

ABE_N = 32
AWR_N = 4

SAMPLES_PERCENTAGE=0.001

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
    parser.add_argument('--max_iter',metavar='N',type=int,default=4,
        help='Max iterations of stream samples')

    # parse arguments
    args = parser.parse_args()

    # get all the layers
    layers = lib.featuremap.get_layers( args.featuremap_path )

    # get all dimensions
    dimensions = lib.featuremap.get_dimensions( args.featuremap_path )

    # get sample of 0.1 of each layer
    stream_samples = np.array([])
    for layer in tqdm(layers,desc="sampling loop"):
        # load feature map
        featuremap = lib.featuremap.load(args.featuremap_path, layer, bitwidth=args.bitwidth)
        sample_length = int(len(featuremap)*SAMPLES_PERCENTAGE)
        sample_start = random.randint(0,len(featuremap)-sample_length-1)
        # create stream in
        stream_in = lib.stream.stream(np.random.choice(featuremap,sample_length), args.bitwidth)
        # append to stream samples
        stream_samples = np.concatenate((stream_samples,stream_in.arr),axis=None)
 
    def run_baseline(stream_in, layer):
        return stream_in, [0,0]

    def run_bi(stream_in, layer):
        return lib.BI.coding.encoder(stream_in), [0,0]

    def run_def(stream_in, layer):
        channels = dimensions[layer][1]
        return lib.DEF.coding.encoder(stream_in, channels=channels), [channels*stream_in.bitwidth, 0]

    def run_pbm(stream_in, layer):
        code_table_stream =copy.deepcopy(stream_in)
        code_table_stream.arr = stream_samples
        code_table = lib.PBM.coding.get_code_table(code_table_stream)
        return lib.PBM.coding.encoder(stream_in, code_table=code_table), [len(code_table.keys())*stream_in.bitwidth,0]

    def run_abe(stream_in, layer):
        return lib.ABE.coding.encoder(stream_in,window_size=ABE_N), [ABE_N*stream_in.bitwidth,0]

    def run_awr(stream_in, layer):
        return lib.AWR.coding.encoder(stream_in,N=AWR_N), [AWR_N,0]

    def run_huffman(stream_in, layer):
        code_table_stream =copy.deepcopy(stream_in)
        code_table_stream.arr = stream_samples
        code_table = lib.Huffman.coding.get_code_table(code_table_stream)
        code_table_size = np.sum([ code_table._table[key][0] for key in code_table._table ])
        return lib.Huffman.coding.encoder(stream_in, code_table), [code_table_size,0]

    def run_rle(stream_in, layer):
        rle_zero = stats.mode(stream_in.arr).mode[0]
        return lib.RLE.coding.encoder(stream_in,rle_zero=rle_zero), [0,0]

    def run_def_rle(stream_in, layer):
        channels = dimensions[layer][1]
        def_stream = lib.DEF.coding.encoder(stream_in, channels=channels, use_correlator=False)
        rle_stream = lib.RLE.coding.encoder(def_stream,rle_zero=0)
        return lib.coding.correlator(rle_stream), [channels*stream_in.bitwidth, 0]
 
    # encoders to run
    encoders = {
        "baseline"  : run_baseline,
        "bi"        : run_bi,
        "def"       : run_def,
        "pbm"       : run_pbm,
        "abe"       : run_abe,
        "awr"       : run_awr,
        "huffman"   : run_huffman,
        "rle"       : run_rle,
        "def_rle"   : run_def_rle,
    }

    # list of metrics for each layer
    metrics = {} 

    # iterate over layers in featuremap
    for layer in layers:

        # add layer to outputs
        metrics[layer] = {}

        # load feature map
        featuremap = lib.featuremap.load(args.featuremap_path, layer, bitwidth=args.bitwidth)

        # iterate over encoders
        for encoder in encoders:
            
            # initialise metrics for encoding scheme
            metrics[layer][encoder] = {
                "bitwidth"          : 0,
                "resources"         : 0,
                "total_transitions" : 0,
                "total_samples"     : 0,
                "average_sa"        : 0,
                "variance_sa"       : 0
            }

            # get folded dimension
            stream_length = functools.reduce(lambda a,b : a*b, dimensions[layer])
                
            if args.save_bin:
                # clean binary file
                with open(os.path.join(args.output_path,"{}{}.bin".format(encoder,layers.index(layer))),"w") as f:
                    f.write("")

            # iterate over each n_limit section
            n_sections = min(args.max_iter,math.ceil(stream_length/args.limit))
            for i in tqdm(range(n_sections),ncols=150,desc="({})\t running {}".format(layer,encoder)):
 
                # create stream in
                stream_in = lib.stream.stream(featuremap[(i*args.limit):min(featuremap.shape[0]-1,((i+1)*args.limit-1))], args.bitwidth)
                
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
                metrics[layer][encoder]["variance_sa"]          += lib.analysis.variance_switching_activity(stream_out).astype(float)/n_sections

    # save output 
    with open(os.path.join(args.output_path,"output_metrics.json"),"w") as f:
        json.dump(metrics, f, indent=4)
