import matplotlib.pyplot as plt
import numpy as np

import lib.stream   as stream
import lib.encoding as encoding
import lib.analysis as analysis

import lib.dsam.coding

import lib.apbm.analysis
import lib.apbm.coding

import lib.abe.coding

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

name         = "lenet"
model_path   = "models/lenet.prototxt"
weight_path  = "weights/lenet.caffemodel"
dataset_path = "/home/alex/mnist" 

cs = stream.caffe_stream(name,model_path,weight_path,dataset_path)

bias            = analysis.bias(cs)
channel_bias    = analysis.channel_bias(cs)

# iterate over layers
sa = {
    "baseline"  : {},
    "dsam"      : {},
    "apbm"      : {},
    "abe"       : {}
}
sa_bias         = {}
sa_channel_bias = {}
sa_diff         = {}
sa_channel_diff = {}
sa_apbm         = {}
sa_abe          = {}
for layer in cs.feature_maps:
    
    print("encoding: ",layer,"\t (baseline)")
    sa["baseline"][layer] = analysis.average_switching_activity(cs.fm_streams[layer])
    cs.fm_streams[layer].array_to_queue()

    print("encoding: ",layer,"\t (dsam)")
    encoded_dsam = lib.dsam.coding.encoder(cs.fm_streams[layer],channels=len(channel_bias[layer]))
    decoded_dsam = lib.dsam.coding.decoder(encoded_dsam,channels=len(channel_bias[layer]))
    decoded_dsam.queue_to_array()
    sa["dsam"][layer] = analysis.average_switching_activity(encoded_dsam)
    cs.fm_streams[layer].array_to_queue()
    
    for i in range(decoded_dsam.arr.shape[0]):
        if decoded_dsam.arr[i].val != cs.fm_streams[layer].arr[i].val:
            print("ERROR", i, decoded_dsam.arr[i].to_int(), cs.fm_streams[layer].arr[i].to_int())

    print("encoding: ",layer,"\t (apbm)")
    code_table = lib.apbm.analysis.get_code_table(cs.fm_streams[layer])
    cs.fm_streams[layer].array_to_queue()
    encoded_apbm = lib.apbm.coding.encoder(cs.fm_streams[layer],code_table)
    sa["apbm"][layer] = analysis.average_switching_activity(encoded_apbm)
    cs.fm_streams[layer].array_to_queue()
    
    print("encoding: ",layer,"\t (abe)")
    encoded_abe = lib.abe.coding.encoder(cs.fm_streams[layer])
    sa["abe"][layer] = analysis.average_switching_activity(encoded_abe)
    cs.fm_streams[layer].array_to_queue()

#analysis.plot_bitwise_probability(cs,prob_type="VAR")

for i in sa:
    print(i)
    print(sa[i])
    plot_sa(sa[i])

