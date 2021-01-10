import argparse
import os
import lib.graph

if __name__ == "__main__":
 
    network_paths = {
            "alexnet"   : {
                "4"     : "outputs/distiller_alexnet_4b/output_metrics.json",
                "8"     : "outputs/distiller_alexnet_8b/output_metrics.json",
                "16"    : "outputs/distiller_alexnet_16b/output_metrics.json"
            },
            "mobilenet" : {
                "2"     : "outputs/distiller_mobilenet_v2_2b/output_metrics.json",
                "4"     : "outputs/distiller_mobilenet_v2_4b/output_metrics.json",
                "6"     : "outputs/distiller_mobilenet_v2_6b/output_metrics.json",
                "8"     : "outputs/distiller_mobilenet_v2_8b/output_metrics.json",
                "10"    : "outputs/distiller_mobilenet_v2_10b/output_metrics.json",
                "12"    : "outputs/distiller_mobilenet_v2_12b/output_metrics.json",
                "14"    : "outputs/distiller_mobilenet_v2_14b/output_metrics.json",
                "16"    : "outputs/distiller_mobilenet_v2_16b/output_metrics.json"
            },
            "googlenet" : {
                "4"     : "outputs/distiller_googlenet_4b/output_metrics.json",
                "8"     : "outputs/distiller_googlenet_8b/output_metrics.json",
                "16"    : "outputs/distiller_googlenet_16b/output_metrics.json",
            },
            "resnet"    : {
                "4"     : "outputs/distiller_resnet18_4b/output_metrics.json",
                "8"     : "outputs/distiller_resnet18_8b/output_metrics.json",
                "16"    : "outputs/distiller_resnet18_16b/output_metrics.json",
            },
            "shufflenet": {
                "4"     : "outputs/distiller_shufflenet_v2_x1_0_4b/output_metrics.json",
                "8"     : "outputs/distiller_shufflenet_v2_x1_0_8b/output_metrics.json",
                "16"    : "outputs/distiller_shufflenet_v2_x1_0_16b/output_metrics.json",
            },
            "squeezenet": {
                "4"     : "outputs/distiller_squeezenet1_0_4b/output_metrics.json",
                "8"     : "outputs/distiller_squeezenet1_0_8b/output_metrics.json",
                "16"    : "outputs/distiller_squeezenet1_0_16b/output_metrics.json",
            },
            "vgg"       : {
                "4"     : "outputs/distiller_vgg11_4b/output_metrics.json",
                "8"     : "outputs/distiller_vgg11_8b/output_metrics.json",
                "16"    : "outputs/distiller_vgg11_16b/output_metrics.json",
            },
    }

    lib.graph.plot_bitwidths(network_paths["mobilenet"], "outputs/bitwidths.png", 
            metric="average_sa",encoding_schemes=["baseline","bi","abe","awr","apbm","deaf"], show_plot=True)


    lib.graph.get_table_encoding_schemes(network_paths["mobilenet"], "outputs/encoding_schemes_table.csv", 
            encoding_schemes=["baseline","bi","abe","awr","apbm","deaf"], print_table=True)


    lib.graph.get_table_compression_schemes(network_paths["googlenet"], "outputs/encoding_schemes_table.csv", 
            encoding_schemes=["baseline","rle","huffman","deaf", "deaf_rle"], print_table=True)

    lib.graph.plot_reduction_per_network(network_paths,"outputs/reduction_per_network.png",
            metric="average_sa", encoding_schemes=["bi","abe","awr","deaf"], show_plot=True)
    
    # plot switching activity per layer
    lib.graph.plot_reduction_per_layer(network_paths["mobilenet"], "outputs/sa_per_layer.png", 
            metric="average_sa", encoding_schemes=["bi","abe","awr","deaf"], show_plot=True)

    lib.graph.plot_transitions_normalised(network_paths["googlenet"],"outputs/sa_per_encoding_scheme.png", 
            bitwidths=["4","8","16"],encoding_schemes=["rle","huffman","deaf", "deaf_rle"], show_plot=True)

    # plot total transitions per sample
    #lib.graph.plot_transitions_per_samples(distiller_paths["densenet"],"outputs/sa_per_encoding_scheme.png", 
    #        encoding_schemes=["baseline","deaf","huffman","rle","deaf_rle"], show_plot=True)

    # plot per encoding scheme
    #lib.graph.plot_per_encoding_scheme_violin_network(distiller_paths["densenet"], "outputs/sa_per_encoding_scheme.png",
    #        metric="average_sa", encoding_scheme_filter=["baseline","abe","bi","deaf","awr","apbm"], show_plot=True)
    
    power_readings = {
        "1" : {
            "abe"       : "scripts/data/abe17.dat",
            "awr"       : "scripts/data/awr17.dat",
            "bi"        : "scripts/data/bi17.dat",
            "deaf"      : "scripts/data/deaf17.dat",
            "pbm"      : "scripts/data/apbm17.dat",
            "baseline"  : "scripts/data/base17.dat",
        },
        "2" : {
            "abe"       : "scripts/data/abe30.dat",
            "awr"       : "scripts/data/awr30.dat",
            "bi"        : "scripts/data/bi30.dat",
            "deaf"      : "scripts/data/deaf30.dat",
            "pbm"      : "scripts/data/apbm30.dat",
            "baseline"  : "scripts/data/base30.dat",
        },
        "3" : {
            "abe"       : "scripts/data/abe39.dat",
            "awr"       : "scripts/data/awr39.dat",
            "bi"        : "scripts/data/bi39.dat",
            "deaf"      : "scripts/data/deaf39.dat",
            "pbm"      : "scripts/data/apbm39.dat",
            "baseline"  : "scripts/data/base39.dat",
        },
        "4" : {
            "abe"       : "scripts/data/abe49.dat",
            "awr"       : "scripts/data/awr49.dat",
            "bi"        : "scripts/data/bi49.dat",
            "deaf"      : "scripts/data/deaf49.dat",
            "pbm"      : "scripts/data/apbm49.dat",
            "baseline"  : "scripts/data/base49.dat",
        },
        "5" : {
            "abe"       : "scripts/data/abe56.dat",
            "awr"       : "scripts/data/awr56.dat",
            "bi"        : "scripts/data/bi56.dat",
            "deaf"      : "scripts/data/deaf56.dat",
            "pbm"      : "scripts/data/apbm56.dat",
            "baseline"  : "scripts/data/base56.dat",
        },
        "6" : {
            "abe"       : "scripts/data/abe64.dat",
            "awr"       : "scripts/data/awr64.dat",
            "bi"        : "scripts/data/bi64.dat",
            "deaf"      : "scripts/data/deaf64.dat",
            "pbm"      : "scripts/data/apbm64.dat",
            "baseline"  : "scripts/data/base64.dat",
        },
        "7" : {
            "abe"       : "scripts/data/abe79.dat",
            "awr"       : "scripts/data/awr79.dat",
            "bi"        : "scripts/data/bi79.dat",
            "deaf"      : "scripts/data/deaf79.dat",
            "pbm"      : "scripts/data/apbm79.dat",
            "baseline"  : "scripts/data/base79.dat",
        },
        "8" : {
            "abe"       : "scripts/data/abe97.dat",
            "awr"       : "scripts/data/awr97.dat",
            "bi"        : "scripts/data/bi97.dat",
            "deaf"      : "scripts/data/deaf97.dat",
            "pbm"      : "scripts/data/apbm97.dat",
            "baseline"  : "scripts/data/base97.dat",
        },
        "9" : {
            "abe"       : "scripts/data/abe101.dat",
            "awr"       : "scripts/data/awr101.dat",
            "bi"        : "scripts/data/bi101.dat",
            "deaf"      : "scripts/data/deaf101.dat",
            "pbm"      : "scripts/data/apbm101.dat",
            "baseline"  : "scripts/data/base101.dat",
        },
    }

    #lib.graph.plot_power_readings(power_readings, "outputs/dfgdfgdf.png", 
    #        encoding_schemes=["baseline","apbm","abe","bi","deaf","awr"], show_plot=True)

    lib.graph.get_power_readings_table(power_readings, "outputs/dfgdfgdf.png", 
            encoding_schemes=["baseline","pbm","abe","bi","awr","deaf"], print_table=True)

    lib.graph.plot_power_readings_average_reduction(power_readings, "outputs/dfgdfgdf.png", 
            encoding_schemes=["pbm","abe","bi","awr","deaf"], show_plot=True)



