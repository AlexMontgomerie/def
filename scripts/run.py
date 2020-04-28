import matplotlib.pyplot as plt
import numpy as np

import lib.stream   as stream
import lib.encoding as encoding
import lib.analysis as analysis
import lib.coding   as coding

import lib.dsam.coding

import lib.apbm.analysis
import lib.apbm.coding

import lib.abe.coding

import lib.bi.coding

import lib.rle.coding

def plot_reduction(sa):
    layers = sa['baseline'].keys()
    x = np.arange(len(layers))
    width = 0.15
    fig, ax = plt.subplots()
    encoding_schemes = []
    for encoding in sa:
        if encoding != 'baseline':
            encoding_schemes.append(encoding)
    for encoding in encoding_schemes:
       # get values
        values = [ 100*(sa['baseline'][layer]-sa[encoding][layer])/sa['baseline'][layer] for layer in layers ]
        offset = encoding_schemes.index(encoding)*width - len(encoding_schemes)*width/2
        ax.bar(x+offset, values, width, label=encoding.upper())
    ax.set_ylabel("Switcihng Activity Reduction (%)")
    ax.set_title("Comparison of Switching Activity Reduction for Encoding Methods in AlexNet")
    ax.set_xticks(x)
    ax.set_xticklabels(layers)
    ax.legend()
    plt.ylim(-100,100)
    plt.show()

def get_table(sa):
    for layer in sa["baseline"]:
        line_out = "layers\t"
        for encoder in sa:
            line_out += encoder+"\t"
    print(line_out)
    for layer in sa["baseline"]:
        line_out = layer+"\t"
        for encoder in sa:
            line_out += "%0.4f" % (sa[encoder][layer]) + "\t"
        print(line_out)

name         = "mobilenet"
model_path   = "models/mobilenet.prototxt"
weight_path  = "weights/mobilenet.caffemodel"
dataset_path = "/home/alex/imagenet" 

name         = "alexnet"
model_path   = "models/alexnet.prototxt"
weight_path  = "weights/alexnet.caffemodel"
dataset_path = "/home/alex/imagenet" 

name         = "vgg"
model_path   = "models/vgg16.prototxt"
weight_path  = "weights/VGG16_SalObjSub.caffemodel"
dataset_path = "/home/alex/imagenet" 

"""
name         = "lenet"
model_path   = "models/lenet.prototxt"
weight_path  = "weights/lenet.caffemodel"
dataset_path = "/home/alex/mnist" 
"""

cs = stream.caffe_stream(name,model_path,weight_path,dataset_path)

bias            = analysis.bias(cs)
channel_bias    = analysis.channel_bias(cs)

# iterate over layers
sa = {
    "baseline"  : {},
    "dsam"      : {},
    "apbm"      : {},
    #"abe"       : {},
    "bi"        : {},
    "rle"       : {}
}

for layer in cs.feature_maps:

    print("encoding: ",layer,"\t (baseline)")
    sa["baseline"][layer] = analysis.average_switching_activity(cs.fm_streams[layer])
    cs.fm_streams[layer].array_to_queue()

    print("encoding: ",layer,"\t (dsam)")
    encoded_dsam = lib.dsam.coding.encoder(cs.fm_streams[layer],channels=len(channel_bias[layer]))
    print(encoded_dsam.arr.shape)
    #decoded_dsam = lib.dsam.coding.decoder(encoded_dsam,channels=len(channel_bias[layer]))
    #decoded_dsam.queue_to_array()
    sa["dsam"][layer] = analysis.average_switching_activity(encoded_dsam)
    cs.fm_streams[layer].array_to_queue()
    #stream.stream.check_streams_equal(decoded_dsam, cs.fm_streams[layer])

    #for i in range(decoded_dsam.arr.shape[0]):
    #    if decoded_dsam.arr[i].val != cs.fm_streams[layer].arr[i].val:
    #        print("ERROR", i, decoded_dsam.arr[i].to_int(), cs.fm_streams[layer].arr[i].to_int())

    print("encoding: ",layer,"\t (apbm)")
    code_table = lib.apbm.analysis.get_code_table(cs.fm_streams[layer])
    cs.fm_streams[layer].array_to_queue()
    encoded_apbm = lib.apbm.coding.encoder(cs.fm_streams[layer],code_table)
    print(encoded_apbm.arr.shape)
    sa["apbm"][layer] = analysis.average_switching_activity(encoded_apbm)
    cs.fm_streams[layer].array_to_queue()
    
    #print("encoding: ",layer,"\t (abe)")
    #encoded_abe = lib.abe.coding.encoder(cs.fm_streams[layer],window_size=len(channel_bias[layer]))
    #sa["abe"][layer] = analysis.average_switching_activity(encoded_abe)
    #cs.fm_streams[layer].array_to_queue()

    print("encoding: ",layer,"\t (bi)")
    encoded_bi = lib.bi.coding.encoder(cs.fm_streams[layer])
    print(encoded_bi.arr.shape)
    sa["bi"][layer] = analysis.average_switching_activity(encoded_bi)
    cs.fm_streams[layer].array_to_queue()

    print("encoding: ",layer,"\t (rle)")
    encoded_rle = lib.rle.coding.encoder(cs.fm_streams[layer])
    print(encoded_rle.arr.shape)
    sa["rle"][layer] = analysis.average_switching_activity(encoded_rle)
    cs.fm_streams[layer].array_to_queue()

#analysis.plot_bitwise_probability(cs,prob_type="VAR")
plot_reduction(sa)
get_table(sa)
for i in sa:
    print(i)
    print(sa[i])
    #plot_sa(sa[i])

