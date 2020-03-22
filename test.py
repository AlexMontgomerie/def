import matplotlib.pyplot as plt
import numpy as np

import lib.stream   as stream
import lib.encoding as encoding
import lib.analysis as analysis

def plot_sa(sa):
    labels = []
    vals   = []
    for layer in sa:
        labels.append(layer)
        vals.append(sa[layer])
    plt.bar(np.arange(len(vals)),vals)
    plt.xticks(np.arange(len(vals)),labels)
    plt.ylabel("Switching Activity")
    plt.xlabel("Layer")
    plt.ylim(0,1)
    plt.show()

name         = "alexnet"
model_path   = "models/alexnet.prototxt"
weight_path  = "weights/alexnet.caffemodel"
dataset_path = "/home/alex/imagenet" 

cs = stream.caffe_stream(name,model_path,weight_path,dataset_path)

bias            = analysis.bias(cs)
channel_bias    = analysis.channel_bias(cs)

# iterate over layers
sa              = {}
sa_bias         = {}
sa_channel_bias = {}
sa_diff         = {}
sa_channel_diff = {}
for layer in cs.feature_maps:
    
    sa[layer] = np.average(analysis.bitwise_probability(cs.fm_streams[layer]))
    # TODO: try encoding
    #print("encoding: ",layer,"\t (bias)")
    #cs.fm_streams[layer].array_to_queue()
    #sa_bias[layer] = np.average(
    #    analysis.bitwise_probability(encoding.no_bias(cs.fm_streams[layer],bias[layer])))
    #cs.fm_streams[layer].array_to_queue()
    #print("encoding: ",layer,"\t (channel bias)")
    #sa_channel_bias[layer] = np.average(
    #    analysis.bitwise_probability(encoding.no_channel_bias(cs.fm_streams[layer],channel_bias[layer])))
    #cs.fm_streams[layer].array_to_queue()
    #print("encoding: ",layer,"\t (diff)")
    #sa_diff[layer] = np.average(
    #    analysis.bitwise_probability(encoding.diff(cs.fm_streams[layer])))
    #cs.fm_streams[layer].array_to_queue()
    #print("encoding: ",layer,"\t (channel diff)")
    #sa_channel_diff[layer] = np.average(
    #    analysis.bitwise_probability(encoding.channel_diff(cs.fm_streams[layer],len(channel_bias[layer]))))
    #cs.fm_streams[layer].array_to_queue()

analysis.plot_bitwise_probability(cs)

#plot_sa(sa)
#plot_sa(sa_bias)
#plot_sa(sa_channel_bias)
#plot_sa(sa_diff)
#plot_sa(sa_channel_diff)
