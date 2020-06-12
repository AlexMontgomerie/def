import deepdish as dd
import numpy as np
from lib.stream import stream
from lib.quantise import sint8
from lib.quantise import sint16

def get_layers(filepath):

    # load file
    featuremaps = dd.io.load(filepath)

    # return keys
    return featuremaps.keys()

def get_dimensions(filepath):

    # load file
    featuremaps = dd.io.load(filepath)

    # get dimensions of each layer
    dimensions = {}
    for layer in featuremaps:
        dimensions[layer] = featuremaps[layer].shape

    return dimensions

def load_layer(filepath, layer):
    return dd.io.load(filepath)[layer]

def to_stream(filepath, layer, offset=0, limit=None, dtype=sint8):

    # convert each feature map into stream
    featuremap = load_layer(filepath,layer)

    # re-order dimensions
    featuremap = np.moveaxis(featuremap,1,-1)
    
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

if __name__ == "__main__":
    tmp = to_stream("featuremaps/distiller_resnet18.h5","module.layer4.1.relu2",limit=10000)

    print(type(tmp.arr[0]))
    #print(tmp.arr[0].to_bin())
