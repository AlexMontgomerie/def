import json
import matplotlib.pyplot as plt
import numpy as np

def plot_bitwise(metric_path, output_path, metric="total_transitions_per_line", single_layer="", encoding_scheme_filter=[], show_plot=True):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(f)
    # get all the layers
    layers = list(metrics.keys())
    # get all encoding schemes
    encoding_schemes = encoding_scheme_filter
    if not encoding_schemes:
        encoding_schemes = list(metrics[layers[0]].keys())
    bitwise_vals = {}
    if single_layer:
        for encoding_scheme in encoding_schemes:
            bitwise_vals[encoding_scheme] = metrics[layer][encoding_scheme][metric]
    else:
        for encoding_scheme in encoding_schemes:
            bitwise_vals[encoding_scheme] = [0]*len(metrics[layers[0]][encoding_schemes[0]][metric])
        for layer in layers:
            for encoding_scheme in encoding_schemes:
                for i in range(len(bitwise_vals[encoding_scheme])):
                    bitwise_vals[encoding_scheme][i] += metrics[layer][encoding_scheme][metric][i]/len(layers)
    # plot switching activity for each layer
    for encoding_scheme in encoding_schemes:
        plt.bar(np.arange(len(bitwise_vals[encoding_scheme])), bitwise_vals[encoding_scheme], label=encoding_scheme)
    plt.legend()
    plt.ylim(bottom=0)
    plt.title("{} bitwise".format(metric))
    plt.ylabel(metric)
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()

def plot_per_layer(metric_path, output_path, metric="total_transitions", encoding_scheme_filter=[], show_plot=True):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(f)
    # get all the layers
    layers = list(metrics.keys())
    # get all encoding schemes
    encoding_schemes = encoding_scheme_filter
    if not encoding_schemes:
        encoding_schemes = list(metrics[layers[0]].keys())
    # transitions
    vals = {}
    for encoding_scheme in encoding_schemes:
        vals[encoding_scheme] = []
    # iterate over layers
    for layer in layers:
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            # append switching activity
            vals[encoding_scheme].append(metrics[layer][encoding_scheme][metric])
    # plot switching activity for each layer
    for encoding_scheme in encoding_schemes:
        plt.plot(layers, vals[encoding_scheme], label=encoding_scheme)
    plt.legend()
    plt.xticks(rotation=45)
    plt.ylim(bottom=0)
    plt.title("{} per Layer".format(metric))
    plt.ylabel(metric)
    plt.grid(True)
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()

def get_table(metric_path, output_path, metric="average_sa", print_table=False):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(f)
    # get all the layers
    layers = list(metrics.keys())
    # get all encoding schemes
    encoding_schemes = list(metrics[layers[0]].keys())
    # create table out
    table_out="\t,"
    # add title of each encoding scheme
    for encoding_scheme in encoding_schemes:
        table_out+="{},".format(encoding_scheme)
    table_out+="\n"
    # iterate over layers
    for layer in layers:
        table_out+="{}\t,".format(layer)
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            table_out+="{:.4f},".format(float(metrics[layer][encoding_scheme][metric])) 
        table_out+="\n"
    # print table in console
    if print_table:
        print(table_out)
    # save to csv file
    with open(output_path,"w") as f:
        f.write(table_out)

def plot_per_encoding_scheme(metric_path, output_path, metric="total_transitions", encoding_scheme_filter=[], show_plot=True):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(f)
    # get all the layers
    layers = list(metrics.keys())
    # get all encoding schemes
    encoding_schemes = encoding_scheme_filter
    if not encoding_schemes:
        encoding_schemes = list(metrics[layers[0]].keys())
    vals = {}
    for encoding_scheme in encoding_schemes:
        vals[encoding_scheme] = 0
    for layer in layers:
        for encoding_scheme in encoding_schemes:
            vals[encoding_scheme] += metrics[layer][encoding_scheme][metric]/len(layers)
    # plot switching activity for each layer
    vals = [ vals[encoding_scheme] for encoding_scheme in encoding_schemes ]
    plt.bar(encoding_schemes, vals)
    plt.ylim(bottom=0)
    plt.xticks(rotation=45)
    plt.title("{} per encoding scheme".format(metric))
    plt.ylabel(metric)
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()


