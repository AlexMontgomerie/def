#!/bin/bash
LIMIT=56000

function run {
    mkdir -p outputs/caffe_alexnet_8b  && python -m scripts.run_featuremap -n alexnet -f featuremaps/caffe_alexnet_8b.h5  -o outputs/caffe_alexnet_8b  -l $LIMIT -b 8
    #mkdir -p outputs/distiller_alexnet_8b && python -m scripts.run_featuremap -n alexnet -f featuremaps/distiller_alexnet_8b.h5 -o outputs/distiller_alexnet_8b -l $LIMIT -b 8
    #mkdir -p outputs/distiller_mobilenet_v2_8b && python -m scripts.run_featuremap -n mobilenet_v2 -f featuremaps/distiller_mobilenet_v2_8b.h5 -o outputs/distiller_mobilenet_v2_8b -l $LIMIT -b 8
}

function run_multi {
    mkdir -p outputs/caffe_alexnet_8b_multi  && python -m scripts.run_featuremap_multi -n alexnet -f featuremaps/caffe_alexnet_8b.h5  -o outputs/caffe_alexnet_8b_multi  -l $LIMIT -b 8
    #mkdir -p outputs/distiller_mobilenet_v2_8b_multi && python -m scripts.run_featuremap_multi -n mobilenet_v2 -f featuremaps/distiller_mobilenet_v2_8b.h5 -o outputs/distiller_mobilenet_v2_8b_multi -l $LIMIT -b 8

}

#run
run_multi

#mkdir -p outputs && python -m scripts.run_graphs
