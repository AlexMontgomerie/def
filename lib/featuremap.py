import deepdish as dd
import numpy as np
import lib.quantise
from lib.stream import stream

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

def to_stream(filepath, layer, offset=0, limit=None, dtype=lib.quantise.sint8, single_batch=False):
    # convert each feature map into stream
    featuremap = load_layer(filepath,layer)
    # re-order dimensions
    featuremap = np.moveaxis(featuremap,1,-1)
    if single_batch:
        featuremap=featuremap[0]
    # flatten feature map
    featuremap = featuremap.reshape(-1)
    # select only portition of the featuremap
    if limit != None:
        featuremap = featuremap[:limit]
    # apply offset 
    featuremap = featuremap.astype(int)
    featuremap = np.subtract(featuremap, offset)
    # convert to sint data type
    sint_convert = np.vectorize( lambda x : dtype(x,convert=True) )
    featuremap = sint_convert(featuremap)
    featuremap = featuremap.astype(dtype)
    # return stream
    return stream(featuremap, dtype=dtype)

