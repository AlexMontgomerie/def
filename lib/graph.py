import json
import matplotlib.pyplot as plt
import matplotlib.style
import matplotlib as mpl
import numpy as np

from cycler import cycler
mpl.rcParams['axes.prop_cycle'] = cycler(color='bgrcmyk')

mpl.rcParams['grid.color'] = 'k'
mpl.rcParams['grid.linestyle'] = ':'
mpl.rcParams['grid.linewidth'] = 0.5

mpl.rcParams['figure.figsize'] = [8.0, 6.0]
mpl.rcParams['figure.dpi'] = 80
mpl.rcParams['savefig.dpi'] = 100

mpl.rcParams['font.size'] = 20 
mpl.rcParams['legend.fontsize'] = 'x-small'
mpl.rcParams['figure.titlesize'] = 'medium'

mpl.rcParams['legend.fancybox'] = False
mpl.rcParams['legend.fontsize'] = 'large'
mpl.rcParams['legend.framealpha'] = None
mpl.rcParams['legend.edgecolor'] = 'inherit'

mpl.rcParams['patch.force_edgecolor'] = True
mpl.rcParams['patch.facecolor'] = 'b'

mpl.rcParams['lines.linewidth'] = 1.0
mpl.rcParams['lines.dashed_pattern'] = [6, 6]
mpl.rcParams['lines.dashdot_pattern'] = [3, 5, 1, 5]
mpl.rcParams['lines.dotted_pattern'] = [1, 3]
mpl.rcParams['lines.scale_dashes'] = False

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

def plot_reduction_per_layer(metric_paths, output_path, bitwidths=["4","8","16"], metric="total_transitions", encoding_schemes=[], show_plot=True):
    # remove box around bar plot
    #mpl.rcParams['patch.force_edgecolor'] = False
    # load the metrics
    metrics = {}
    for bitwidth in bitwidths:
        with open(metric_paths[bitwidth],"r") as f:
            metrics[bitwidth] = json.load(f)
    # transitions
    vals = { bitwidth : { encoding_scheme: [] for encoding_scheme in encoding_schemes } for bitwidth in bitwidths }
    for bitwidth in bitwidths:
        # get all the layers
        layers = list(metrics[bitwidth].keys())
        # iterate over layers
        for layer in layers:
            # iterate over encoding schemes
            for encoding_scheme in encoding_schemes:
                # append metric
                val = ((metrics[bitwidth][layer]["baseline"][metric]-metrics[bitwidth][layer][encoding_scheme][metric])*100)/metrics[bitwidth][layer]["baseline"][metric]
                vals[bitwidth][encoding_scheme].append(val)
    # plot graph
    col_width=0.9
    colors='bgrcmyk'
    fig, axs = plt.subplots(nrows=len(encoding_schemes), ncols=len(bitwidths), sharey=True, sharex=True, squeeze=False)
    for idx, bitwidth in enumerate(bitwidths):
        axs[0,idx].set_title("Bitwidth = {}".format(bitwidth))
        for idy, encoding_scheme in enumerate(encoding_schemes):
            # bitwidth index
            ax = axs[idy,idx]
            # plot bar graph
            #ax.axhline(y=baseline[bitwidth],color="g",ls="--",lw=2)
            layers = list(metrics[bitwidth].keys())
            x = np.arange(0,len(layers))
            ax.bar(x,vals[bitwidth][encoding_scheme],width=col_width,alpha=1.0,color=colors[idy],
                    label=encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper())
            ax.grid(True)
            ax.set_xlim([0,len(vals[bitwidth][encoding_scheme])])
            ax.set_xticks([])
            if idx == 0 :
                ax.set_ylabel(encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper())
    fig.add_subplot(111,frameon=False)
    plt.tick_params(labelcolor='none', top=False, bottom=False, left=False, right=False)
    plt.ylabel("Average Activity Reduction (%)\n")
    if show_plot:
        plt.show()

def plot_reduction_per_network(metric_paths, output_path, metric="total_transitions", bitwidths=["4","8","16"], encoding_schemes=[], show_plot=True):
    # load metrics for each network
    metrics = {}
    for bitwidth in bitwidths:
        metrics[bitwidth] = {}
        for network in metric_paths:
            with open(metric_paths[network][bitwidth],"r") as f:
                metrics[bitwidth][network] = json.load(f)
    # outputs
    vals = { bitwidth : { encoding_scheme: [] for encoding_scheme in encoding_schemes } for bitwidth in bitwidths }
    # iterate over bitwidths
    for bitwidth in bitwidths:
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            # iterate over networks
            for network in metrics[bitwidth]:
                # get average switching activity
                average_metric = _get_average_metric(metrics[bitwidth][network], metric)
                vals[bitwidth][encoding_scheme].append( ((average_metric['baseline']-average_metric[encoding_scheme])*100)/average_metric['baseline'] )
    # flatten values
    #vals = { encoding_scheme: [ vals[encoding_scheme][network] for network in metrics ] for encoding_scheme in encoding_schemes }
    # create plots
    col_width=0.9/len(encoding_schemes)
    x = np.arange(0,len(metric_paths.keys()))
    fig, axs = plt.subplots(nrows=len(bitwidths), ncols=1, sharey=True, sharex=True, squeeze=False)
    plt.xticks(rotation=45)
    plt.xticks(x+0.9/2,metric_paths.keys())
    for bitwidth in bitwidths:
        ax =axs[bitwidths.index(bitwidth),0]
        ax.set_ylabel("Bitwidth = {}".format(bitwidth))
        ax.yaxis.grid(True)
        ax.set_xlim([0,len(metric_paths.keys())])
        for encoding_scheme in encoding_schemes:
            print(encoding_scheme,vals[bitwidth][encoding_scheme])
            #position = x+(col_width*(1-len(metric_paths.keys()))/2) + col_width * encoding_schemes.index(encoding_scheme)
            ax.bar(x+col_width/2+col_width*encoding_schemes.index(encoding_scheme),vals[bitwidth][encoding_scheme],width=col_width, 
                    label=encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper())
        if bitwidths.index(bitwidth) == 0:
            ax.legend(ncol=len(encoding_schemes))
    fig.add_subplot(111,frameon=False)
    plt.tick_params(labelcolor='none', top=False, bottom=False, left=False, right=False)
    plt.ylabel("Switching Activity Reduction (%)\n")
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

def plot_transitions_per_samples(metric_path, output_path, encoding_schemes=[], show_plot=True):
    # load the metrics
    with open(metric_path,"r") as f:
        metrics = json.load(f)
    # empty 
    tr = { encoding_scheme: 0 for encoding_scheme in encoding_schemes }
    cr = { encoding_scheme: 0 for encoding_scheme in encoding_schemes }
    # get all the layers
    layers = list(metrics.keys())
    total_samples = _get_total_samples(metrics)
    for encoding_scheme in encoding_schemes:
        # get number of samples
        cr[encoding_scheme] = total_samples["baseline"]/total_samples[encoding_scheme]
        # accumulate total transitions
        tr_baseline = 0
        for layer in layers:
            tr_baseline += metrics[layer]["baseline"]["total_transitions"]
            tr[encoding_scheme] += metrics[layer][encoding_scheme]["total_transitions"]
        tr[encoding_scheme] = tr[encoding_scheme]/tr_baseline
    # plot graph
    for encoding_scheme in encoding_schemes:
        tr_ratio = tr[encoding_scheme]/cr[encoding_scheme]
        plt.plot([cr[encoding_scheme],1.0],[tr[encoding_scheme],tr_ratio],ms=5,marker="x",
                label=encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper())
    plt.ylabel("Transition Ratio")
    plt.xlabel("Compression Ratio")
    plt.legend()
    plt.grid(True)
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()

def plot_transitions_normalised(metric_paths, output_path, encoding_schemes=[], bitwidths=["4","8","16"], show_plot=True):
    # load metrics for each bitwidth 
    metrics = {}
    for bitwidth in bitwidths:
        with open(metric_paths[bitwidth],"r") as f:
            metrics[bitwidth] = json.load(f)
    # empty results 
    sa      = { bitwidth : { encoding_scheme: 0 for encoding_scheme in encoding_schemes } for bitwidth in bitwidths }
    sa_norm = { bitwidth : { encoding_scheme: 0 for encoding_scheme in encoding_schemes } for bitwidth in bitwidths }
    baseline= { bitwidth : 0 for bitwidth in bitwidths }
    # iterate over bus widths
    for bitwidth in bitwidths:
        total_samples = _get_total_samples(metrics[bitwidth])
        average_sa = _get_average_metric(metrics[bitwidth], "average_sa")
        baseline[bitwidth] = average_sa["baseline"]
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            # get compression ratio
            cr = total_samples["baseline"]/total_samples[encoding_scheme]
            # get switching activity 
            sa[bitwidth][encoding_scheme]       = average_sa[encoding_scheme]
            sa_norm[bitwidth][encoding_scheme]  = average_sa[encoding_scheme]/cr
    # plot graph
    col_width=0.3
    fig, axs = plt.subplots(nrows=1, ncols=len(bitwidths), sharey=True, squeeze=False)
    for bitwidth in bitwidths:
        # bitwidth index
        ax = axs[0,int(bitwidths.index(bitwidth))]
        # flatten results
        x = np.arange(0,len(encoding_schemes))
        y1 = [ sa[bitwidth][encoding_scheme]       for encoding_scheme in encoding_schemes ]
        y2 = [ sa_norm[bitwidth][encoding_scheme]  for encoding_scheme in encoding_schemes ]
        # plot bar graph
        ax.axhline(y=baseline[bitwidth],color="g",ls="--",lw=2)
        ax.bar(x-col_width/2,y1,width=col_width,alpha=0.75,color="r",label="compressed")
        ax.bar(x+col_width/2,y2,width=col_width,alpha=0.75,color="b",label="normalised")
        ax.grid(True)
        ax.set_title("Bus Width = {}".format(bitwidth))
        # change axes
        plt.sca(ax)
        tmp = [ x.replace("deaf","def").replace("_","+").upper() for x in encoding_schemes ]
        plt.xticks(np.arange(0,len(encoding_schemes)),tmp)
        plt.xticks(rotation=45)
    axs[0,0].set_ylabel("Switching Activity")
    axs[0,len(bitwidths)-1].legend()
    if show_plot:
        plt.show()
    """
    col_width=0.9/len(encoding_schemes)
    x = np.arange(0,len(metrics.keys()))
    for encoding_scheme in encoding_schemes:
        plt.bar(x+col_width*encoding_schemes.index(encoding_scheme),vals[encoding_scheme],width=col_width, label=encoding_scheme)
    plt.xticks(x+0.9*0.5,metrics.keys())
    plt.xticks(rotation=45)
    """

def get_table_encoding_schemes(metric_paths, output_path, encoding_schemes=[], print_table=False):
    # load metrics for each bitwidth 
    metrics = {}
    for bitwidth in metric_paths:
        with open(metric_paths[bitwidth],"r") as f:
            metrics[bitwidth] = json.load(f)
    # create table out
    table_out=""
    # iterate over layers
    for encoding_scheme in encoding_schemes:
        table_out += "{} & ".format(encoding_scheme)
        # transition ratio
        for bitwidth in ["4", "8", "16"]:
            transitions = _get_average_metric(metrics[bitwidth],"total_transitions")
            t_ratio = transitions[encoding_scheme]/transitions["baseline"]
            table_out += "{:.4f} & ".format(t_ratio)
        # average switching activity
        for bitwidth in ["4", "8", "16"]:
            table_out += "{:.4f} & ".format(_get_average_metric(metrics[bitwidth],"average_sa")[encoding_scheme])
        # memory usage
        for bitwidth in ["4", "8", "16"]:
            storage = int(_get_average_metric(metrics[bitwidth],"resources")[encoding_scheme]/8)
            table_out += "{} & ".format(storage)
        # required bus width
        for bitwidth in ["4", "8", "16"]:
            table_out += "{} & ".format(int(_get_average_metric(metrics[bitwidth],"bitwidth")[encoding_scheme]))
        table_out += "\\\\ \n"
    if print_table:
        print(table_out)
    # save to csv file
    with open(output_path,"w") as f:
        f.write(table_out)

def get_table_compression_schemes(metric_paths, output_path, encoding_schemes=[], print_table=False):
    # load metrics for each bitwidth 
    metrics = {}
    for bitwidth in metric_paths:
        with open(metric_paths[bitwidth],"r") as f:
            metrics[bitwidth] = json.load(f)
    # create table out
    table_out=""
    # iterate over layers
    for encoding_scheme in encoding_schemes:
        table_out += "{} & ".format(encoding_scheme)
        # transition ratio
        for bitwidth in ["4", "8", "16"]:
            transitions = _get_average_metric(metrics[bitwidth],"total_transitions")
            t_ratio = transitions[encoding_scheme]/transitions["baseline"]
            table_out += "{:.4f} & ".format(t_ratio)
        # average switching activity
        for bitwidth in ["4", "8", "16"]:
            table_out += "{:.4f} & ".format(_get_average_metric(metrics[bitwidth],"average_sa")[encoding_scheme])
        # compression ratio
        for bitwidth in ["4", "8", "16"]:
            samples = _get_total_samples(metrics[bitwidth])
            cr = samples["baseline"]/samples[encoding_scheme]
            table_out += "{:.2f} & ".format(cr)
        # memory usage
        for bitwidth in ["4", "8", "16"]:
            storage = int(_get_average_metric(metrics[bitwidth],"resources")[encoding_scheme]/8)
            table_out += "{} & ".format(storage)
        table_out += "\\\\ \n"
    if print_table:
        print(table_out)
    # save to csv file
    with open(output_path,"w") as f:
        f.write(table_out)

def plot_bitwidths(metric_paths, output_path, metric="average_sa", encoding_schemes=[], show_plot=False):
    # load metrics for each network
    metrics = {}
    for bitwidth in metric_paths:
        with open(metric_paths[bitwidth],"r") as f:
            metrics[bitwidth] = json.load(f)
    # outputs
    vals = { encoding_scheme: { bitwidth: 0 for bitwidth in metrics } for encoding_scheme in encoding_schemes }
    # iterate over bitwidths
    for bitwidth in metrics:
        # iterate over encoding schemes
        for encoding_scheme in encoding_schemes:
            # get average of metric
            average_metric = _get_average_metric(metrics[bitwidth], metric)
            vals[encoding_scheme][bitwidth] = average_metric[encoding_scheme]
    # plot metric for each encoding scheme
    vals = { encoding_scheme: [ vals[encoding_scheme][bitwidth] for bitwidth in metrics ] for encoding_scheme in encoding_schemes }
    for encoding_scheme in encoding_schemes:
        plt.plot(list(metrics.keys()), vals[encoding_scheme],
                label=encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper())
    plt.legend()
    plt.title("{} bitwise".format(metric))
    plt.ylabel(metric)
    plt.xlabel("bitwidth")
    plt.grid(True)
    plt.savefig(output_path,bbox_inches='tight')
    if show_plot:
        plt.show()

def plot_power_readings(power_readings, output_path, encoding_schemes=[], show_plot=False):
    # function to read power data
    def _read_dat(filename):
        dat = []
        with open(filename,"r") as f:
            lines = f.readlines()
            for line in lines:
                dat.append(float(line))
        return dat
    # load power data for each block and encoding scheme
    blocks = {}
    for block_index in power_readings:
        blocks[block_index] = {}
        for encoding_scheme in encoding_schemes:
            blocks[block_index][encoding_scheme] = _read_dat(
                    power_readings[block_index][encoding_scheme])
    # create subplots
    fig, axs = plt.subplots(nrows=len(list(blocks.keys())), ncols=1, sharey=True, squeeze=False)
    # iterate over block
    for block_index in blocks:
        # plot for each encoding scheme
        for encoding_scheme in encoding_schemes:
            ax = axs[int(block_index)-1,0]
            ax.plot(blocks[block_index][encoding_scheme], label=encoding_scheme)
            ax.grid(True)
    axs[0,0].legend()
    if show_plot:
        plt.show()

def get_power_readings_table(power_readings, output_path, encoding_schemes=[], print_table=False):
    # function to read power data
    def _read_dat(filename):
        dat = []
        with open(filename,"r") as f:
            lines = f.readlines()
            for line in lines:
                dat.append(float(line))
        return dat
    # load power data for each block and encoding scheme
    blocks = {}
    for block_index in power_readings:
        blocks[block_index] = {}
        for encoding_scheme in encoding_schemes:
            blocks[block_index][encoding_scheme] = np.average(_read_dat(
                    power_readings[block_index][encoding_scheme]))
    table_out = ""
    # iterate over encoding schemes
    for encoding_scheme in encoding_schemes:
        table_out += "\\textit{{{}}} & ".format(encoding_scheme)
        for block_index in power_readings:
            table_out += "{:.1f} & ".format(blocks[block_index][encoding_scheme]*1000)
        avg = np.average([ blocks[block_index][encoding_scheme] for block_index in blocks ])
        table_out += "{:.1f} \\\\ \n".format(avg*1000)
    # print table in console
    if print_table:
        print(table_out)

def plot_power_readings_reduction(power_readings, output_path, encoding_schemes=[], show_plot=False):
    # function to read power data
    def _read_dat(filename):
        dat = []
        with open(filename,"r") as f:
            lines = f.readlines()
            for line in lines:
                dat.append(float(line))
        return dat
    # load power data for each block and encoding scheme
    blocks = {}
    for encoding_scheme in encoding_schemes:
        blocks[encoding_scheme] = []
        for block_index in power_readings:
            base = np.average(_read_dat(power_readings[block_index]["baseline"]))
            enc  = np.average(_read_dat(power_readings[block_index][encoding_scheme]))
            blocks[encoding_scheme].append((base-enc)/base *100)
    # get reduction instead

    # create subplots
    fig, axs = plt.subplots(nrows=len(encoding_schemes), ncols=1, sharey=True, squeeze=False, sharex=True)
    x = np.arange(0,len(power_readings.keys()))
    col_width = 0.7
    colors='bgrcmyk'
    # plot for each encoding scheme
    for idx, encoding_scheme in enumerate(encoding_schemes):
        ax = axs[idx,0]
        ax.set_ylabel(encoding_scheme)
        ax.yaxis.grid(True)
        ax.bar(x,blocks[encoding_scheme], color=colors[idx], width=col_width,
                label=encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper())
        ax.set_xticks([])
    fig.add_subplot(111,frameon=False)
    plt.tick_params(labelcolor='none', top=False, bottom=False, left=False, right=False)
    plt.ylabel("Power Reduction (%)\n\n")
    if show_plot:
        plt.show()

def plot_power_readings_average_reduction(power_readings, output_path, encoding_schemes=[], show_plot=False):
    # function to read power data
    def _read_dat(filename):
        dat = []
        with open(filename,"r") as f:
            lines = f.readlines()
            for line in lines:
                dat.append(float(line))
        return dat
    # load power data for each block and encoding scheme
    vals = {}
    for encoding_scheme in encoding_schemes:
        vals[encoding_scheme] = []
        for block_index in power_readings:
            vals[encoding_scheme].extend(_read_dat(power_readings[block_index][encoding_scheme]))
    # add baseline
    vals["baseline"] = []
    for block_index in power_readings:
        vals["baseline"].extend(_read_dat(power_readings[block_index]["baseline"]))
    # get average reduction
    reduction = {}
    for encoding_scheme in encoding_schemes:
        base = np.average(vals["baseline"])
        enc  = np.average(vals[encoding_scheme])
        reduction[encoding_scheme] = ((base-enc)/base *100)
    # flatten
    reduction = [ reduction[encoding_scheme] for encoding_scheme in encoding_schemes ]
    # create plot
    colors='bgrcmyk'
    encoding_schemes = [ encoding_scheme.replace("deaf","def").replace("apbm","pbm").upper() for encoding_scheme in encoding_schemes ]
    plt.bar(encoding_schemes,reduction,color=colors[:len(encoding_schemes)])
    plt.ylabel("Memory Power Reduction (%)")
    plt.ylim(bottom=0)
    plt.xticks(rotation=45)
    plt.gca().yaxis.grid(True)
    #plt.grid(True)
    if show_plot:
        plt.show()


