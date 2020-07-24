#!/bin/bash

function run_network {
    # get arguments
    network=$1
    bitwidth=$2
    limit=$3
    # run script
    mkdir -p outputs/${network} && python -m scripts.run_featuremap -f featuremaps/${network}.h5  -o outputs/${network}  -l $LIMIT -b ${bitwidth}
}

function run_asym {
    LIMIT=200000
    BITWIDTH=8
    # distiller 8-bit
    run_network distiller_alexnet_8b            $BITWIDTH   $LIMIT
    run_network distiller_densenet121_8b        $BITWIDTH   $LIMIT
    run_network distiller_googlenet_8b          $BITWIDTH   $LIMIT
    run_network distiller_mobilenet_v2_8b       $BITWIDTH   $LIMIT
    run_network distiller_resnet18_8b           $BITWIDTH   $LIMIT
    run_network distiller_shufflenet_v2_x1_0_8b $BITWIDTH   $LIMIT
    run_network distiller_squeezenet1_0_8b      $BITWIDTH   $LIMIT
    run_network distiller_vgg11_8b              $BITWIDTH   $LIMIT
}

function run_sym {
    LIMIT=200000
    BITWIDTH=8
    # distiller 8-bit (symmetric)
    run_network distiller_sym_alexnet_8b            $BITWIDTH   $LIMIT
    run_network distiller_sym_densenet121_8b        $BITWIDTH   $LIMIT
    run_network distiller_sym_googlenet_8b          $BITWIDTH   $LIMIT
    run_network distiller_sym_mobilenet_v2_8b       $BITWIDTH   $LIMIT
    run_network distiller_sym_resnet18_8b           $BITWIDTH   $LIMIT
    run_network distiller_sym_shufflenet_v2_x1_0_8b $BITWIDTH   $LIMIT
    run_network distiller_sym_squeezenet1_0_8b      $BITWIDTH   $LIMIT
    run_network distiller_sym_vgg11_8b              $BITWIDTH   $LIMIT
}

function run_mobilenet {
    LIMIT=200000
    # distiller 8-bit
    run_network distiller_mobilenet_v2_2b   2   $LIMIT
    run_network distiller_mobilenet_v2_4b   4   $LIMIT
    run_network distiller_mobilenet_v2_6b   6   $LIMIT
    run_network distiller_mobilenet_v2_8b   8   $LIMIT
    run_network distiller_mobilenet_v2_10b  10  $LIMIT
    run_network distiller_mobilenet_v2_12b  12  $LIMIT
    run_network distiller_mobilenet_v2_14b  14  $LIMIT
    run_network distiller_mobilenet_v2_16b  16  $LIMIT
}

<<<<<<< HEAD
run_mobilenet
run_asym

=======
#run_network distiller_alexnet_8b 10000
##run_mobilenet
#run_asym

#mkdir -p outputs/distiller_mobilenet_v2_8b && python -m scripts.run_featuremap -f featuremaps/distiller_mobilenet_v2_8b.h5  -o outputs/distiller_mobilenet_v2_8b -l 100000 -b 8 --save_bin
mkdir -p outputs/distiller_alexnet_8b_test && python -m scripts.run_featuremap -f featuremaps/distiller_alexnet_8b.h5  -o outputs/distiller_alexnet_8b_test -l 200000 -b 8
>>>>>>> 8d6561a3118fb2ac23954841b4d86d8f62498b91
