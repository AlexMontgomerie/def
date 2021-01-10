import deepdish as dd
import numpy as np

def get_layers(filepath):
    # load file
    featuremaps = dd.io.load(filepath)
    # return keys
    return featuremaps['layers']

def get_dimensions(filepath):
    # load file
    featuremaps = dd.io.load(filepath)
    # get dimensions of each layer
    dimensions = {}
    #get layers 
    layers = get_layers(filepath)
    # iterate over layers
    for layer in layers:
        dimensions[layer] = featuremaps[layer].shape
    # return dimensions
    return dimensions

def load_layer(filepath, layer):
    return dd.io.load(filepath)[layer]

def load(filepath, layer, restricted_range=False, sample_range=[0,-1], bitwidth=8, single_batch=False):
    # convert each feature map into stream
    featuremap = load_layer(filepath,layer)
    # re-order dimensions
    featuremap = np.moveaxis(featuremap,1,-1)
    if single_batch:
        featuremap=featuremap[0]
    # flatten feature map
    featuremap = featuremap.reshape(-1)
    # apply restricted range
    if restricted_range:
        featuremap = np.clip(featuremap,-((2**(bitwidth-1))-1),((2**(bitwidth-1))-1))    
    # apply mask
    featuremap = np.bitwise_and( featuremap, ((2**bitwidth)-1) )
    # return featuremap
    return featuremap

def from_dat(filepath):
    return np.array(np.loadtxt(filepath).reshape(-1), np.uint32)

