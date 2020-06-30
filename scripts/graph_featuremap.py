import argparse
import os
import lib.graph

if __name__ == "__main__":
  
    # plot switching activity per layer
    lib.graph.plot_per_layer("outputs/distiller_googlenet_8b/output_metrics.json", "outputs/sa_per_layer.png", 
            metric="average_sa", encoding_scheme_filter=["abe","bi","dsam","apbm","awr","baseline"], show_plot=True)

    """
    # plot bitwise transitions
    lib.graph.plot_bitwise("outputs/caffe_alexnet_8b/output_metrics.json", "outputs/bitwise_transitions.png",
            metric="average_sa_per_line", encoding_scheme_filter=["baseline","dsam"], show_plot=True)
    """

    # 
    lib.graph.plot_per_encoding_scheme("outputs/distiller_densenet121_8b/output_metrics.json", "outputs/sa_per_encoding_scheme.png",
            metric="total_transitions", encoding_scheme_filter=[], show_plot=True)

    lib.graph.plot_transitions_per_samples("outputs/distiller_densenet121_8b/output_metrics.json","outputs/sa_per_encoding_scheme.png", 
            encoding_scheme_filter=["rle","rle_dsam","huffman","huffman_bi","baseline"], show_plot=True)

    metric_paths = {
            "alexnet"   : "outputs/distiller_alexnet_8b/output_metrics.json",
            #"mobilenet" : "outputs/distiller_mobilenet_v2_8b/output_metrics.json",
            "densenet"  : "outputs/distiller_densenet121_8b/output_metrics.json",
            #"resnet"    : "outputs/distiller_resnet18_8b/output_metrics.json",
            "googlenet" : "outputs/distiller_googlenet_8b/output_metrics.json",
            #"shufflenet": "outputs/distiller_shufflenet_v2_x1_0_8b/output_metrics.json",
            #"squeezenet": "outputs/distiller_squeezenet1_0_8b/output_metrics.json",
            #"vgg"       : "outputs/distiller_vgg11_8b/output_metrics.json",
    }
    lib.graph.plot_sa_cr(metric_paths, "outputs/sa_cr.png", encoding_scheme="rle_dsam", show_plot=True)

    """
    # plot transitions per layer
    lib.graph.plot_per_layer(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"transitions_per_layer.png"), 
            metric="total_transitions", encoding_scheme_filter=[], show_plot=True)

    # plot bitwise transitions
    lib.graph.plot_bitwise(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"bitwise_transitions.png"),
            metric="average_sa_per_line", encoding_scheme_filter=[], show_plot=True)

    lib.graph.plot_per_encoding_scheme(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"sa_per_encoding_scheme.png"),
            metric="average_sa", encoding_scheme_filter=[], show_plot=True)

    lib.graph.plot_transitions_per_samples(os.path.join(args.metric_path,"output_metrics.json"), os.path.join(args.metric_path,"sa_per_encoding_scheme.png"), 
            encoding_scheme_filter=["rle","rle_dsam","huffman","huffman_bi","baseline"], show_plot=True)
    """
