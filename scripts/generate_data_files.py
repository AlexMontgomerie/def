import os
import json
import argparse
from tqdm import tqdm

import lib.featuremap

import lib.apbm.coding

if __name__ == "__main__":

    # setup argument parser
    parser = argparse.ArgumentParser(description="Convert .h5 files to .dat for each layer")
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

    # get dimensions for all layers
    layer_dimensions = lib.featuremap.get_dimensions( args.featuremap_path )

    # encoding schemes
    encoding_schemes = [
        #"baseline",
        "bi",      
        "def",    
        #"apbm",    
        "abe",     
        #"awr",     
        #"huffman", 
        #"rle",     
        #"deaf_rle",
    ] 

    # iterate over layers in featuremap
    for layer in tqdm(layers,desc="saving each layer"):

        # load featuremap 
        featuremap = lib.featuremap.load(args.featuremap_path, layer, bitwidth=args.bitwidth)
        
        # save featuremap to .dat file 
        with open(os.path.join(args.output_path,"{}.dat".format(layer)),"w") as f:
            f.write( "\n".join([str(x) for x in featuremap]) )

        ## Baseline
        with open(os.path.join(args.output_path,"baseline","{}.dat".format(layer)),"w") as f:
            f.write( "\n".join([str(x) for x in featuremap]) )

        # generate config files
        ## BI
        config = {
            "bitwidth"  : args.bitwidth,
            "sc_width"  : 1,
            "resources" : 0,
        }
        with open(os.path.join(args.output_path,"bi","{}_config.json".format(layer)),"w") as f:
            json.dump(config,f)
        ## ABE
        config = {
            "bitwidth"      : args.bitwidth,
            "sc_width"      : 1,
            "window_size"   : args.bitwidth,
            "resources"     : args.bitwidth*args.bitwidth,
        }
        with open(os.path.join(args.output_path,"abe","{}_config.json".format(layer)),"w") as f:
            json.dump(config,f)
        ## DEF
        config = {
            "bitwidth"      : args.bitwidth,
            "sc_width"      : 0,
            "channels"      : layer_dimensions[layer][1], 
            "resources"     : args.bitwidth*args.bitwidth,
        }
        with open(os.path.join(args.output_path,"def","{}_config.json".format(layer)),"w") as f:
            json.dump(config,f)
        ## APBM
        code_table = lib.apbm.coding.get_code_table(featuremap, bitwidth=args.bitwidth)
        config = {
            "bitwidth"      : args.bitwidth,
            "sc_width"      : 0,
            "code_table"    : code_table,
            "resources"     : args.bitwidth*args.bitwidth,
        }
        with open(os.path.join(args.output_path,"apbm","{}_config.json".format(layer)),"w") as f:
            json.dump(config,f)
        ## AWR
