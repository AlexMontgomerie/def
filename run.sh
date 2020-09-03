#!/bin/bash

# block commenting
alias BEGINCOMMENT="if [ ]; then"
alias ENDCOMMENT="fi"

function generate_all_dat_files {

    python -m scripts.generate_data_files -f featuremaps/caffe_alexnet_8b.h5 -o outputs/caffe_alexnet_8b -b 8 
 
}

function evaluate_coding_schemes {

    python -m scripts.evaluate_coding_schemes -f featuremaps/caffe_alexnet_8b.h5 -o outputs/caffe_alexnet_8b -b 8 
 
}


function run_encoder {

    encoder=$1
    network=$2
    bitwidth=$3

    # make output directory
    mkdir -p outputs/caffe_${network}_${bitwidth}b/${encoder}

    # iterate over layers
    for layer_path in outputs/caffe_${network}_${bitwidth}b/*.dat; do


        # strip layer name
        layer=${layer_path%".dat"}
        layer=${layer##*/}  
        
        echo "${encoder}: running layer ${layer} of ${network}"

        # assign all paths
        config_path=outputs/caffe_${network}_${bitwidth}b/${encoder}/${layer}_config.json
        input_path=outputs/caffe_${network}_${bitwidth}b/${layer}.dat
        output_path=outputs/caffe_${network}_${bitwidth}b/${encoder}/${layer}.dat

        # run for layer 
        ./outputs/${encoder}_encoder -c ${config_path} < ${input_path} > ${output_path}

    done
}

# generate all files
generate_all_dat_files

# compile all encoding schemes
g++ src/bi.cpp      -o outputs/bi_encoder
#g++ src/abe.cpp     -o outputs/abe_encoder
g++ src/def.cpp src/decorr.cpp -o outputs/def_encoder
g++ src/apbm.cpp src/decorr.cpp -o outputs/apbm_encoder

# run each encoding scheme
time run_encoder bi     alexnet 8
#time run_encoder abe    alexnet 8
time run_encoder def    alexnet 8
time run_encoder apbm   alexnet 8

# get output metrics 
evaluate_coding_schemes 
