import os
import json
import argparse
import numpy as np
from tqdm import tqdm

import lib.featuremap
import lib.stream
import lib.analysis

if __name__ == "__main__":

    # setup argument parser
    parser = argparse.ArgumentParser(description="Evaluate ")
    parser.add_argument('-n','--name', type=str, default="network", help='Name of network')
    parser.add_argument('-f','--featuremap_path',metavar='PATH',required=True,
        help='Path to feature map file (.h5)')
    parser.add_argument('-o','--output_path',metavar='PATH',required=True,
        help='Path for output (.json)')
    parser.add_argument('-b','--bitwidth',metavar='N',type=int,default=8,
        help='Bitwidth of samples')

    # parse arguments
    args = parser.parse_args()

    # get all the layers
    layers = lib.featuremap.get_layers( args.featuremap_path )

    # encoding schemes
    encoding_schemes = [
        "baseline",
        #"bi",      
        "def",    
        "apbm",    
        #"abe",     
        #"awr",     
        #"huffman", 
        #"rle",     
        #"deaf_rle",
    ] 

    # list of metrics for each layer
    metrics = {} 

    # iterate over layers in featuremap
    for layer in tqdm(layers):

        # add layer to outputs
        metrics[layer] = {}

        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:

            # initialise metrics for encoding scheme
            metrics[layer][encoding_scheme] = {}

            # load featuremap from .dat file 
            featuremap = lib.featuremap.from_dat( os.path.join(args.output_path,encoding_scheme,"{}.dat".format(layer)) )
    
            # convert to stream
            # featuremap = lib.stream.stream(featuremap)

            """ 
            if args.save_bin:
                # clean binary file
                with open(os.path.join(args.output_path,"{}{}.bin".format(encoder,layers.index(layer))),"w") as f:
                    f.write("")
            # save to binary file
            if args.save_bin:
                featremap.to_bin(os.path.join(args.output_path,"{}{}.bin".format(encoder,layers.index(layer))))
            """

            bitwidth = args.bitwidth

            # transitions in stream
            transitions = np.bitwise_xor(featuremap[1:],featuremap[:-1])
            transitions = np.array([ bin(x).count('1') for x in transitions ])

            # update metrics
            #metrics[layer][encoder]["bitwidth"]             = int(stream_out.bitwidth + stream_out.sc_width)
            #metrics[layer][encoder]["resources"]            += int(resources[0])/n_sections
            metrics[layer][encoding_scheme]["total_transitions"]    = np.sum(transitions).astype(float)
            metrics[layer][encoding_scheme]["total_samples"]        = featuremap.shape[0]
            metrics[layer][encoding_scheme]["average_sa"]           = np.average(transitions/bitwidth).astype(float)
            metrics[layer][encoding_scheme]["variance_sa"]          = np.var(transitions/bitwidth).astype(float)

    # save output 
    with open(os.path.join(args.output_path,"output_metrics.json"),"w") as f:
        json.dump(metrics, f, indent=4)

