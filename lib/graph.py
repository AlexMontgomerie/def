import json
import matplotlib.pyplot as plt
import numpy as np

def _get_total_samples(metrics):
    # get layers and encoding schemes
    layers = list(metrics.keys())
    encoding_schemes = list(metrics[layers[0]].keys())
    # total transitions
    total_samples = {}
    for encoding_scheme in encoding_schemes:
        total_samples[encoding_scheme] = 0
    # iterate over layers
    for layer in layers:
        for encoding_scheme in encoding_schemes:
            total_samples[encoding_scheme] += metrics[layer][encoding_scheme]["total_samples"]
    # return table of all samples
    return total_samples

def _get_average_metric(metrics, metric):
    # get layers and encoding schemes
    layers = list(metrics.keys())
    encoding_schemes = list(metrics[layers[0]].keys())
    # total transitions
    total_samples = {}
    vals = {}
    total_samples = _get_total_samples(metrics)
    for encoding_scheme in encoding_schemes:
        vals[encoding_scheme] = 0
    for layer in layers:
        for encoding_scheme in encoding_schemes:
            vals[encoding_scheme] += metrics[layer][encoding_scheme][metric]*(
                    metrics[layer][encoding_scheme]["total_samples"]/total_samples[encoding_scheme])
    # return values
    return vals

def _get_average_metric_bitwise(metrics, metric):
    # get layers and encoding schemes
    layers = list(metrics.keys())
    encoding_schemes = list(metrics[layers[0]].keys())
    # total transitions
    total_samples = {}
    bitwise_vals = {}
    total_samples = _get_total_samples(metrics)
    for encoding_scheme in encoding_schemes:
        bitwise_vals[encoding_scheme] = [0]*len(metrics[layers[0]][encoding_schemes[0]][metric])
    for layer in layers:
        for encoding_scheme in encoding_schemes:
            for i in range(len(bitwise_vals[encoding_scheme])):
                bitwise_vals[encoding_scheme][i] += metrics[layer][encoding_scheme][metric][i]*(
                        metrics[layer][encoding_scheme]["total_samples"]/total_samples[encoding_scheme])
    # return values
    return bitwise_vals

def plot_bitwise(metric_path, output_path, metric="total_transitions_per_line", encoding_scheme_filter=[], show_plot=True):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(f)
    # get all the layers
    layers = list(metrics.keys())
    # get all encoding schemes
    encoding_schemes = encoding_scheme_filter
    if not encoding_schemes:
        encoding_schemes = list(metrics[layers[0]].keys())
    # get average of metric across layers
    bitwise_vals = _get_average_metric_bitwise(metrics, metric)
    # filter encoding schemes
    bitwise_vals = {key: bitwise_vals[key] for key in encoding_schemes}
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
    vals = {encoding_scheme: [] for encoding_scheme in encoding_schemes}
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
    total_samples = _get_total_samples(metrics)
    for encoding_scheme in encoding_schemes:
        vals[encoding_scheme] = 0
    for layer in layers:
        for encoding_scheme in encoding_schemes:
            vals[encoding_scheme] += metrics[layer][encoding_scheme][metric]*(
                    metrics[layer][encoding_scheme]["total_samples"]/total_samples[encoding_scheme])
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

def plot_per_encoding_scheme_violin(metric_paths, output_path, metric="total_transitions", encoding_scheme_filter=[], show_plot=True):
    # load the metrics
    metrics = {}
    for network in metric_paths:
        with open(metric_paths[network],"r") as f:
                metrics[network] = json.load(f)
    # get all encoding schemes
    encoding_schemes = encoding_scheme_filter
    # empty 
    vals = { encoding_scheme: { network: 0 for network in metrics } for encoding_scheme in encoding_schemes }
    #vals = { encoding_scheme: [] for encoding_scheme in encoding_schemes }
    for network in metrics:
        # get all the layers
        layers = list(metrics[network].keys())
        total_samples = _get_total_samples(metrics[network])
        for layer in layers:
            for encoding_scheme in encoding_schemes:
                vals[encoding_scheme][network] += metrics[network][layer][encoding_scheme][metric]*(
                        metrics[network][layer][encoding_scheme]["total_samples"]/total_samples[encoding_scheme])
                #vals[encoding_scheme].append(metrics[network][layer][encoding_scheme][metric])
    # plot switching activity for each layer
    vals = [ [ vals[encoding_scheme][network] for network in vals[encoding_scheme] ] for encoding_scheme in encoding_schemes ]
    #vals = [ vals[encoding_scheme] for encoding_scheme in encoding_schemes ]
    #plt.bar(encoding_schemes, vals)
    fig, ax = plt.subplots()
    ax.violinplot(vals, showmeans=True, showmedians=False)
    #ax.boxplot(vals, sym='')
    ax.set_xticks(np.arange(1,len(encoding_schemes)+1))
    ax.set_xticklabels(encoding_schemes)
    ax.yaxis.grid(True)
    #plt.ylim(bottom=0)
    #plt.ylim([0,1])
    plt.xticks(rotation=45)
    #plt.title("{} per encoding scheme".format(metric))
    plt.ylabel("average switching activity")
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()

def plot_transitions_per_samples(metric_path, output_path, encoding_scheme_filter=[], show_plot=True):
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
    total_samples = _get_total_samples(metrics)
    for layer in layers:
        for encoding_scheme in encoding_schemes:
            vals[encoding_scheme] += metrics[layer][encoding_scheme]["total_transitions"]
    for encoding_scheme in encoding_schemes:
        plt.scatter([total_samples[encoding_scheme]],[vals[encoding_scheme]])
        plt.text(total_samples[encoding_scheme],vals[encoding_scheme], encoding_scheme)
    plt.title("Total Transitions")
    plt.ylabel("Transitions")
    plt.xlabel("Samples")
    plt.grid(True)
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()

def plot_sa_cr(metric_paths, output_path, encoding_scheme_filter=[], show_plot=True):
    # load metrics for each network
    metrics = {}
    for network in metric_paths:
        print(network)
        with open(metric_paths[network],"r") as f:
            metrics[network] = json.load(f)
    # get all encoding schemes
    encoding_schemes = encoding_scheme_filter
    if not encoding_schemes:
        encoding_schemes = list(metrics[layers[0]].keys())
    # outputs
    encoded = { encoding_scheme: { network: [0,0] for network in metrics } for encoding_scheme in encoding_schemes }
    # iterate over encoding schemes
    for encoding_scheme in encoding_schemes:
        # iterate over networks
        for network in metrics:
            # get average switching activity
            average_sa = _get_average_metric(metrics[network], "average_sa")
            #encoded[encoding_scheme][network][0] = (average_sa["baseline"] - average_sa[encoding_scheme])/average_sa["baseline"]
            #encoded[encoding_scheme][network][0] = average_sa[encoding_scheme]/average_sa["baseline"]
            encoded[encoding_scheme][network][0] = average_sa[encoding_scheme]
            # get compression ratio
            total_samples = _get_total_samples(metrics[network])
            encoded[encoding_scheme][network][1] = total_samples["baseline"]/total_samples[encoding_scheme]
    # plot for each network
    for encoding_scheme in encoding_schemes:
        x = []
        y = []
        for network in metrics:
            x.append(encoded[encoding_scheme][network][0])
            y.append(encoded[encoding_scheme][network][1])
        plt.scatter(x, y, label= encoding_scheme)
        #plt.text(encoded[network][0], encoded[network][1], network )
    #plt.xlim([0,1])
    #plt.ylim([0,1])
    #plt.yscale("log")
    plt.title("Total Transitions")
    plt.ylabel("Compression Ratio")
    plt.xlabel("Switching Activity")
    plt.grid(True)
    plt.legend()
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()


