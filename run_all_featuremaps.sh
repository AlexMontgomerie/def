#!/bin/bash

function run_network {
    # get arguments
    network=$1
    limit=$2
    # run script
    mkdir -p outputs/${network} && python -m scripts.run_featuremap -f featuremaps/${network}.h5  -o outputs/${network}  -l $LIMIT -b 8
}

function run_multi_network {
    # get arguments
    network=$1
    limit=$2
    # run script
    mkdir -p outputs/${network}_multi && python -m scripts.run_featuremap_multi -f featuremaps/${network}.h5  -o outputs/${network}_multi  -l $LIMIT -b 8
}

function run_asym {
    LIMIT=100000
    # distiller 8-bit
    run_network distiller_alexnet_8b            $LIMIT
    run_network distiller_densenet121_8b        $LIMIT
    run_network distiller_googlenet_8b          $LIMIT
    run_network distiller_mobilenet_v2_8b       $LIMIT
    run_network distiller_resnet18_8b           $LIMIT
    run_network distiller_shufflenet_v2_x1_0_8b $LIMIT
    run_network distiller_squeezenet1_0_8b      $LIMIT
    run_network distiller_vgg11_8b              $LIMIT
}

function run_sym {
    LIMIT=100000
    # distiller 8-bit (symmetric)
    run_network distiller_sym_alexnet_8b            $LIMIT
    run_network distiller_sym_densenet121_8b        $LIMIT
    run_network distiller_sym_googlenet_8b          $LIMIT
    run_network distiller_sym_mobilenet_v2_8b       $LIMIT
    run_network distiller_sym_resnet18_8b           $LIMIT
    run_network distiller_sym_shufflenet_v2_x1_0_8b $LIMIT
    run_network distiller_sym_squeezenet1_0_8b      $LIMIT
    run_network distiller_sym_vgg11_8b              $LIMIT
}

function run_multi {
    LIMIT=100000
    # distiller 8-bit
    run_multi_network distiller_alexnet_8b            $LIMIT
    run_multi_network distiller_densenet121_8b        $LIMIT
    run_multi_network distiller_googlenet_8b          $LIMIT
    run_multi_network distiller_mobilenet_v2_8b       $LIMIT
    run_multi_network distiller_resnet18_8b           $LIMIT
    run_multi_network distiller_shufflenet_v2_x1_0_8b $LIMIT
    run_multi_network distiller_squeezenet1_0_8b      $LIMIT
    run_multi_network distiller_vgg11_8b              $LIMIT
}

#run_network distiller_alexnet_8b 10000
run_asym
run_sym
run_multi

#mkdir -p outputs && python -m scripts.run_graphs
