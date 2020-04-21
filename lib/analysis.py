import matplotlib.pyplot as plt
import numpy as np

def _stream_to_bin_array(stream_in):
    return np.array([ val.to_bin() for val in stream_in.arr ])

def _get_transitions(stream_in):
    bin_stream_in = _stream_to_bin_array(stream_in)
    return np.bitwise_xor(bin_stream_in[1:,:],bin_stream_in[:-1,:])

def bitwise_probability(stream_in):
    return np.average(_stream_to_bin_array(stream_in),axis=0)

def bitwise_mean(stream_in):
    return np.average(_stream_to_bin_array(stream_in),axis=0)

def bitwise_variance(stream_in):
    return np.var(_stream_to_bin_array(stream_in),axis=0)

def average_switching_activity(stream_in):
    return np.average(_get_transitions(stream_in))

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

def plot_bitwise_probability(net,prob_type="MEAN"):
    # iterate over layers
    bit_prob = {}
    for layer in net.feature_maps:
        # get the bitwise probobility
        if prob_type == "MEAN":
            bit_prob[layer] = bitwise_mean(net.fm_streams[layer])
        if prob_type == "VAR":
            bit_prob[layer] = bitwise_variance(net.fm_streams[layer])
        # plot probability
        plt.plot(np.arange(len(bit_prob[layer])),bit_prob[layer])
    plt.ylim(0,1)
    plt.show()

def plot_bitwise_variance(net):
    # iterate over layers
    bit_prob = {}
    for layer in net.feature_maps:
        # get the bitwise probobility
        bit_prob[layer] = bitwise_probability(net.fm_streams[layer])
        # plot probability
        plt.plot(np.arange(len(bit_prob[layer])),bit_prob[layer])
    plt.ylim(0,1)
    plt.show()

