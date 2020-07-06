#!/bin/bash

function run_single {
    LIMIT=10000
    mkdir -p outputs/caffe_alexnet_8b && python -m scripts.run_featuremap -n alexnet -f featuremaps/caffe_alexnet_8b.h5  -o outputs/caffe_alexnet_8b  -l $LIMIT -b 8

}

function run_asym {
    LIMIT=50000
    # distiller 8-bit
    mkdir -p outputs/distiller_alexnet_8b && python -m scripts.run_featuremap -n alexnet -f featuremaps/distiller_alexnet_8b.h5 -o outputs/distiller_alexnet_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_densenet121_8b && python -m scripts.run_featuremap -n densenet -f featuremaps/distiller_densenet121_8b.h5 -o outputs/distiller_densenet121_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_googlenet_8b && python -m scripts.run_featuremap -n googlenet -f featuremaps/distiller_googlenet_8b.h5 -o outputs/distiller_googlenet_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_mobilenet_v2_8b && python -m scripts.run_featuremap -n mobilenet -f featuremaps/distiller_mobilenet_v2_8b.h5 -o outputs/distiller_mobilenet_v2_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_resnet18_8b && python -m scripts.run_featuremap -n resnet -f featuremaps/distiller_resnet18_8b.h5 -o outputs/distiller_resnet18_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_shufflenet_v2_x1_0_8b && python -m scripts.run_featuremap -n shufflenet -f featuremaps/distiller_shufflenet_v2_x1_0_8b.h5 -o outputs/distiller_shufflenet_v2_x1_0_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_squeezenet1_0_8b && python -m scripts.run_featuremap -n squeezenet -f featuremaps/distiller_squeezenet1_0_8b.h5 -o outputs/distiller_squeezenet1_0_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_vgg11_8b && python -m scripts.run_featuremap -n vgg -f featuremaps/distiller_vgg11_8b.h5 -o outputs/distiller_vgg11_8b -l $LIMIT -b 8
}

function run_sym {
    LIMIT=50000
    # distiller 8-bit (symmetric)
    mkdir -p outputs/distiller_sym_alexnet_8b && python -m scripts.run_featuremap -n alexnet -f featuremaps/distiller_sym_alexnet_8b.h5 -o outputs/distiller_sym_alexnet_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_densenet121_8b && python -m scripts.run_featuremap -n densenet -f featuremaps/distiller_sym_densenet121_8b.h5 -o outputs/distiller_sym_densenet121_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_googlenet_8b && python -m scripts.run_featuremap -n googlenet -f featuremaps/distiller_sym_googlenet_8b.h5 -o outputs/distiller_sym_googlenet_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_mobilenet_v2_8b && python -m scripts.run_featuremap -n mobilenet -f featuremaps/distiller_sym_mobilenet_v2_8b.h5 -o outputs/distiller_sym_mobilenet_v2_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_resnet18_8b && python -m scripts.run_featuremap -n resnet -f featuremaps/distiller_sym_resnet18_8b.h5 -o outputs/distiller_sym_resnet18_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_shufflenet_v2_x1_0_8b && python -m scripts.run_featuremap -n shufflenet -f featuremaps/distiller_sym_shufflenet_v2_x1_0_8b.h5 -o outputs/distiller_sym_shufflenet_v2_x1_0_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_squeezenet1_0_8b && python -m scripts.run_featuremap -n squeezenet -f featuremaps/distiller_sym_squeezenet1_0_8b.h5 -o outputs/distiller_sym_squeezenet1_0_8b -l $LIMIT -b 8
    mkdir -p outputs/distiller_sym_vgg11_8b && python -m scripts.run_featuremap -n vgg -f featuremaps/distiller_sym_vgg11_8b.h5 -o outputs/distiller_sym_vgg11_8b -l $LIMIT -b 8

}

function run_multi {
    LIMIT=10000
    mkdir -p outputs/distiller_alexnet_8b_multi  && python -m scripts.run_featuremap_multi -n alexnet -f featuremaps/distiller_alexnet_8b.h5  -o outputs/distiller_alexnet_8b_multi  -l $LIMIT -b 8
    #mkdir -p outputs/distiller_mobilenet_v2_8b_multi && python -m scripts.run_featuremap_multi -n mobilenet_v2 -f featuremaps/distiller_mobilenet_v2_8b.h5 -o outputs/distiller_mobilenet_v2_8b_multi -l $LIMIT -b 8

}

#run_single
#run_asym
#run_sym
run_multi

#mkdir -p outputs && python -m scripts.run_graphs
