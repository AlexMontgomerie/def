
LIMIT=5000

mkdir -p outputs/caffe_mobilenet_16b && python -m scripts.run_featuremap -n mobilenet -f featuremaps/caffe_mobilenet_16b.h5 -o outputs/caffe_mobilenet_16b -l $LIMIT
