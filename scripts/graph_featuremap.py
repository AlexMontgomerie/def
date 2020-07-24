import argparse
import os
import lib.graph

if __name__ == "__main__":
 
    caffe_paths = {
            "alexnet"   : "outputs/caffe_alexnet_8b/output_metrics.json"
    }

    distiller_sym_paths = {
            "alexnet"   : "outputs/distiller_sym_alexnet_8b/output_metrics.json",
            "mobilenet" : "outputs/distiller_sym_mobilenet_v2_8b/output_metrics.json",
            "densenet"  : "outputs/distiller_sym_densenet121_8b/output_metrics.json",
            "resnet"    : "outputs/distiller_sym_resnet18_8b/output_metrics.json",
            "googlenet" : "outputs/distiller_sym_googlenet_8b/output_metrics.json",
            "shufflenet": "outputs/distiller_sym_shufflenet_v2_x1_0_8b/output_metrics.json",
            "squeezenet": "outputs/distiller_sym_squeezenet1_0_8b/output_metrics.json",
            "vgg"       : "outputs/distiller_sym_vgg11_8b/output_metrics.json",
    }

    distiller_paths = {
            "alexnet"   : "outputs/distiller_alexnet_8b/output_metrics.json",
            "mobilenet" : "outputs/distiller_mobilenet_v2_8b/output_metrics.json",
            "densenet"  : "outputs/distiller_densenet121_8b/output_metrics.json",
            "resnet"    : "outputs/distiller_resnet18_8b/output_metrics.json",
            "googlenet" : "outputs/distiller_googlenet_8b/output_metrics.json",
            "shufflenet": "outputs/distiller_shufflenet_v2_x1_0_8b/output_metrics.json",
            "squeezenet": "outputs/distiller_squeezenet1_0_8b/output_metrics.json",
            "vgg"       : "outputs/distiller_vgg11_8b/output_metrics.json",
    }

    mobilenet_paths = {
            "2"     : "outputs/distiller_mobilenet_v2_2b/output_metrics.json",
            "4"     : "outputs/distiller_mobilenet_v2_4b/output_metrics.json",
            "6"     : "outputs/distiller_mobilenet_v2_6b/output_metrics.json",
            "8"     : "outputs/distiller_mobilenet_v2_8b/output_metrics.json",
            "10"    : "outputs/distiller_mobilenet_v2_10b/output_metrics.json",
            "12"    : "outputs/distiller_mobilenet_v2_12b/output_metrics.json",
            "14"    : "outputs/distiller_mobilenet_v2_14b/output_metrics.json",
            "16"    : "outputs/distiller_mobilenet_v2_16b/output_metrics.json",
    }


    power_readings = {
        "1" : {
            "abe"       : "scripts/data/abe.dat",
            "awr"       : "scripts/data/awr.dat",
            "bi"        : "scripts/data/bi.dat",
            "deaf"      : "scripts/data/deaf.dat",
            "apbm"      : "scripts/data/apbm.dat",
            "baseline"  : "scripts/data/base.dat",
        },
        "2" : {
            "abe"       : "scripts/data/abe.dat",
            "awr"       : "scripts/data/awr.dat",
            "bi"        : "scripts/data/bi.dat",
            "deaf"      : "scripts/data/deaf.dat",
            "apbm"      : "scripts/data/apbm.dat",
            "baseline"  : "scripts/data/base.dat",
        },
        "3" : {
            "abe"       : "scripts/data/abe.dat",
            "awr"       : "scripts/data/awr.dat",
            "bi"        : "scripts/data/bi.dat",
            "deaf"      : "scripts/data/deaf.dat",
            "apbm"      : "scripts/data/apbm.dat",
            "baseline"  : "scripts/data/base.dat",
        },
        "4" : {
            "abe"       : "scripts/data/abe.dat",
            "awr"       : "scripts/data/awr.dat",
            "bi"        : "scripts/data/bi.dat",
            "deaf"      : "scripts/data/deaf.dat",
            "apbm"      : "scripts/data/apbm.dat",
            "baseline"  : "scripts/data/base.dat",
        }
    }

    lib.graph.plot_power_readings(power_readings, "outputs/dfgdfgdf.png", 
            encoding_schemes=["baseline","apbm","abe","bi","deaf","awr"], show_plot=True)

    #lib.graph.plot_bitwidths(mobilenet_paths, "outputs/bitwidths.png", 
    #        metric="average_sa",encoding_schemes=["baseline","abe","bi","deaf","apbm","awr"], show_plot=True)


    lib.graph.get_table_encoding_schemes(mobilenet_paths, "outputs/encoding_schemes_table.csv", 
            encoding_schemes=["baseline","abe","bi","apbm","awr","deaf"], print_table=True)


    lib.graph.get_table_compression_schemes(mobilenet_paths, "outputs/encoding_schemes_table.csv", 
            encoding_schemes=["baseline","deaf","rle","deaf_rle","huffman"], print_table=True)

    # plot switching activity per layer
    lib.graph.plot_reduction_per_layer_2(mobilenet_paths, "outputs/sa_per_layer.png", 
            metric="average_sa", encoding_schemes=["abe","bi","deaf","awr"], show_plot=True)

    #lib.graph.plot_reduction_per_network(distiller_paths,"outputs/reduction_per_network.png",
    #        metric="average_sa", encoding_scheme_filter=["abe","bi","deaf","awr"], show_plot=True)
    

    lib.graph.plot_transitions_normalised(mobilenet_paths,"outputs/sa_per_encoding_scheme.png", 
            bitwidths=["4","8","16"],encoding_schemes=["huffman","rle","deaf","deaf_rle"], show_plot=True)


    # plot total transitions per sample
    #lib.graph.plot_transitions_per_samples(distiller_paths["densenet"],"outputs/sa_per_encoding_scheme.png", 
    #        encoding_schemes=["baseline","deaf","huffman","rle","deaf_rle"], show_plot=True)

    # plot per encoding scheme
    #lib.graph.plot_per_encoding_scheme_violin_network(distiller_paths["densenet"], "outputs/sa_per_encoding_scheme.png",
    #        metric="average_sa", encoding_scheme_filter=["baseline","abe","bi","deaf","awr","apbm"], show_plot=True)
    
    #lib.graph.plot_sa_cr(distiller_paths, "outputs/sa_cr.png", encoding_scheme_filter=["baseline","deaf","rle","huffman"], show_plot=True)

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
