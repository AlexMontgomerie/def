import argparse
import os
import lib.graph

if __name__ == "__main__":

    # setup argument parser
    parser = argparse.ArgumentParser(description="Feature map encoding script")
    parser.add_argument('-n','--name', type=str, default="network", help='Name of network')
    parser.add_argument('-m','--metric_path', metavar='PATH', required=True, help='Path to metrics')

    # parse arguments
    args = parser.parse_args()
    
    # plot switching activity per layer
    #lib.graph.plot_per_layer(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"sa_per_layer.png"), 
    #        metric="average_sa", encoding_scheme_filter=[], show_plot=True)

    # plot transitions per layer
    #lib.graph.plot_per_layer(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"transitions_per_layer.png"), 
    #        metric="total_transitions", encoding_scheme_filter=[], show_plot=True)

    # plot bitwise transitions
    lib.graph.plot_bitwise(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"bitwise_transitions.png"),
            metric="average_sa_per_line", encoding_scheme_filter=["baseline","dsam_parallel"], show_plot=True)

    lib.graph.plot_per_encoding_scheme(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"sa_per_encoding_scheme.png"),
            metric="average_sa", encoding_scheme_filter=[], show_plot=True)
#def plot_bitwise(metric_path, output_path, metric="total_transitions_per_line", single_layer="", encoding_scheme_filter=[], show_plot=True):
