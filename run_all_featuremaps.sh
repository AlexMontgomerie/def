
LIMIT=100000

#mkdir -p outputs/caffe_alexnet_8b  && python -m scripts.run_featuremap -n alexnet -f featuremaps/caffe_alexnet_8b.h5  -o outputs/caffe_alexnet_8b  -l $LIMIT -b 8
#mkdir -p outputs/caffe_alexnet_8b  && python -m scripts.graph_featuremap -n alexnet -m outputs/caffe_alexnet_8b

#mkdir -p outputs/caffe_alexnet_8b_multi  && python -m scripts.run_featuremap_multi -n alexnet -f featuremaps/caffe_alexnet_8b.h5  -o outputs/caffe_alexnet_8b_multi  -l $LIMIT -b 8
#mkdir -p outputs/caffe_alexnet_8b_multi  && python -m scripts.graph_featuremap -n alexnet -m outputs/caffe_alexnet_8b_multi

#mkdir -p outputs/distiller_mobilenet_v2_8b && python -m scripts.run_featuremap -n mobilenet_v2 -f featuremaps/distiller_mobilenet_v2_8b.h5 -o outputs/distiller_mobilenet_v2_8b -l $LIMIT -b 8
mkdir -p outputs/distiller_mobilenet_v2_8b && python -m scripts.graph_featuremap -n alexnet -m outputs/distiller_mobilenet_v2_8b

#mkdir -p outputs/distiller_mobilenet_v2_8b_multi && python -m scripts.run_featuremap -n mobilenet_v2 -f featuremaps/distiller_mobilenet_v2_8b.h5 -o outputs/distiller_mobilenet_v2_8b_multi -l $LIMIT -b 8
#mkdir -p outputs/distiller_mobilenet_v2_8b_multi && python -m scripts.graph_featuremap -n alexnet -m outputs/distiller_mobilenet_v2_8b_multi


#mkdir -p outputs/distiller_alexnet_8b  && python -m scripts.run_featuremap -n alexnet -f featuremaps/distiller_alexnet_8b.h5  -o outputs/distiller_alexnet_8b  -l $LIMIT -b 8
#mkdir -p outputs/caffe_alexnet_8b  && python -m scripts.run_featuremap_multi -n alexnet -f featuremaps/caffe_alexnet_8b.h5  -o outputs/caffe_alexnet_8b  -l $LIMIT -b 8
#mkdir -p outputs/caffe_alexnet_16b && python -m scripts.run_featuremap -n alexnet -f featuremaps/caffe_alexnet_16b.h5 -o outputs/caffe_alexnet_16b -l $LIMIT -b 8


#mkdir -p outputs/caffe_mobilenet_16b && python -m scripts.run_featuremap -n mobilenet -f featuremaps/caffe_mobilenet_16b.h5 -o outputs/caffe_mobilenet_16b -l $LIMIT -b 8


#mkdir -p outputs/distiller_alexnet && python -m scripts.run_featuremap -n alexnet -f featuremaps/distiller_alexnet.h5 -o outputs/distiller_alexnet -l $LIMIT -b 8
