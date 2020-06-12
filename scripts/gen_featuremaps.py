from lib.generate import gen_caffe_featuremap

gen_caffe_featuremap("models/alexnet.prototxt", "weights/alexnet.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_alexnet_8b.h5", bitwidth=8)
gen_caffe_featuremap("models/alexnet.prototxt", "weights/alexnet.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_alexnet_16b.h5", bitwidth=16)

gen_caffe_featuremap("models/mobilenet.prototxt", "weights/mobilenet.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_mobilenet_8b.h5", bitwidth=8)
gen_caffe_featuremap("models/mobilenet.prototxt", "weights/mobilenet.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_mobilenet_16b.h5", bitwidth=16)

gen_caffe_featuremap("models/googlenet.prototxt", "weights/googlenet.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_googlenet_8b.h5", bitwidth=8)
gen_caffe_featuremap("models/googlenet.prototxt", "weights/googlenet.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_googlenet_16b.h5", bitwidth=16)

gen_caffe_featuremap("models/resnet50.prototxt", "weights/resnet50.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_resnet50_8b.h5", bitwidth=8)
gen_caffe_featuremap("models/resnet50.prototxt", "weights/resnet50.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_resnet50_16b.h5", bitwidth=16)

gen_caffe_featuremap("models/vgg16.prototxt", "weights/vgg16.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_vgg16_8b.h5", bitwidth=8)
gen_caffe_featuremap("models/vgg16.prototxt", "weights/vgg16.caffemodel", "/home/alex/imagenet/val","featuremaps/caffe_vgg16_16b.h5", bitwidth=16)
