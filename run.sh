#!/bin/bash

function run_encoder {

    encoder=$1
    network=$2
    bitwidth=$3

    # make output directory
    mkdir -p outputs/distiller_${network}_${bitwidth}b/${encoder}

    # iterate over layers
    for layer_path in outputs/distiller_${network}_${bitwidth}b/*.dat; do


        # strip layer name
        layer=${layer_path%".dat"}
        layer=${layer##*/}  
        
        echo "${encoder}: running layer ${layer} of ${network}"

        # assign all paths
        mkdir -p outputs/distiller_${network}_${bitwidth}b/${encoder}
        config_path=outputs/distiller_${network}_${bitwidth}b/${encoder}/${layer}_config.json
        input_path=outputs/distiller_${network}_${bitwidth}b/${layer}.dat
        output_path=outputs/distiller_${network}_${bitwidth}b/${encoder}/${layer}.dat

        # run for layer 
        ./outputs/${encoder}_encoder -c ${config_path} < ${input_path} > ${output_path}

    done
}

function run_network {

    network=$1
    bitwidth=$2

    # create output folders 
    mkdir -p outputs/distiller_${network}_${bitwidth}b/baseline
    mkdir -p outputs/distiller_${network}_${bitwidth}b/bi
    mkdir -p outputs/distiller_${network}_${bitwidth}b/abe
    mkdir -p outputs/distiller_${network}_${bitwidth}b/def
    mkdir -p outputs/distiller_${network}_${bitwidth}b/apbm
    mkdir -p outputs/distiller_${network}_${bitwidth}b/awr

    # generate data files
    python -m scripts.generate_data_files -f featuremaps/distiller_${network}_${bitwidth}b.h5 -o outputs/distiller_${network}_${bitwidth}b -b ${bitwidth}

    # run encoders
    time run_encoder bi     $network $bitwidth
    time run_encoder abe    $network $bitwidth
    time run_encoder def    $network $bitwidth
    time run_encoder apbm   $network $bitwidth
    time run_encoder awr    $network $bitwidth

    # evaluate coding schemes
    python -m scripts.evaluate_coding_schemes -f featuremaps/distiller_${network}_${bitwidth}b.h5 -o outputs/distiller_${network}_${bitwidth}b -b ${bitwidth}

}

# compile all encoding schemes
g++ src/bi.cpp      -o outputs/bi_encoder
g++ src/abe.cpp     -o outputs/abe_encoder
g++ src/def.cpp src/decorr.cpp -o outputs/def_encoder
g++ src/apbm.cpp src/decorr.cpp -o outputs/apbm_encoder
g++ src/awr.cpp -o outputs/awr_encoder

# run each encoding scheme
run_network alexnet 8
run_network densenet121 8 
run_network googlenet 8 
run_network mobilenet_v2 8 
run_network resnet18 8 
run_network shufflenet_v2_x1_0 8 
run_network squeezenet1_0 8 
run_network vgg11 8 

