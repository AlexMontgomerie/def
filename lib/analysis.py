import matplotlib.pyplot as plt
import numpy as np

def bitwise_probability(stream_in):
    # accumulate bits
    bit_average = np.zeros(stream_in.bitwidth, dtype=np.float32)
    for val in stream_in.arr:
        bit_average += val.to_bin()
    # return per-bit average
    return np.true_divide(bit_average,stream_in.arr.shape[0])


# Stream Statistics
def bias(caffe_stream_in):
    # iterate over layers
    bias = {}
    for layer in caffe_stream_in.feature_maps:
        bias[layer] = np.average(caffe_stream_in.feature_maps[layer])
    return bias

def channel_bias(caffe_stream_in):
    # iterate over layers
    channel_bias = {}
    for layer in caffe_stream_in.feature_maps:
        feature_map =np.reshape(caffe_stream_in.feature_maps[layer],(-1,caffe_stream_in.net.blobs[layer].data[...].shape[1]))
        channel_bias[layer] = np.average(feature_map,axis=0)
    return channel_bias

# Graphs
def plot_switching_activity(stream,transition_encoding=True):
    pass

def plot_bitwise_probability(net):
    # iterate over layers
    bit_prob = {}
    for layer in net.feature_maps:
        # get the bitwise probobility
        bit_prob[layer] = bitwise_probability(net.fm_streams[layer])
        # plot probability
        plt.plot(np.arange(len(bit_prob[layer])),bit_prob[layer])
    plt.ylim(0,1)
    plt.show()

