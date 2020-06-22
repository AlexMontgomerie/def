import json
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

def plot_switching_activity_per_layer(metric_path, output_path):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(metric_path)
    # get all the layers
    layers = metrics.keys()
    # get all encoding schemes
    encoding_schemes = metrics[layers[0]].keys()
    # switching activity
    sa = {}
    for encoding_scheme in encoding_schemes:
        sa[encoding_scheme] = []
    # iterate over layers
    for layer in layers:
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            # append switching activity
            sa[encoding_scheme].append(metrics[layer][encoding_scheme]["average_sa"])
    # plot switching activity for each layer
    for encoding_scheme in encoding_schemes:
        plt.plot(layers, sa[encoding_scheme], label=encoding_scheme)

def get_switching_activity_table(metric_path, output_path, print_table=False):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(metric_path)
    # get all the layers
    layers = metrics.keys()
    # get all encoding schemes
    encoding_schemes = metrics[layers[0]].keys()
    # switching activity
    sa = {}
    for encoding_scheme in encoding_schemes:
        sa[encoding_scheme] = []
    # iterate over layers
    for layer in layers:
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            # append switching activity
            sa[encoding_scheme].append(metrics[layer][encoding_scheme]["average_sa"])
    # create table out
    table_out="\t\t,"
    # add title of each encoding scheme
    for encoding_scheme in encoding_schemes:
        table_out+="{}\t,".format(encoding_scheme)
    table_out+="\n"
    # iterate over layers
    for layer in layers:
        table_out+="{}\t,".format(layer)
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            table_out+="{:.4f},".format(sa[encoding_scheme]) 
        table_out+="\n"
    # print table in console
    if print_table:
        print(table_out)
    # save to csv file
    with open(output_path,"w") as f:
        f.write(table_out)

