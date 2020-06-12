import matplotlib.pyplot as plt

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


