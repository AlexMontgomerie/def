from lib.generate import gen_caffe_featuremap

"""
# mobilenet
gen_caffe_featuremap(
    "models/mobilenet.prototxt", 
    "weights/mobilenet.caffemodel", 
    #"/home/alex/imagenet/val/n01632777",
    "/home/alex/imagenet/val",
    "featuremaps/caffe_mobilenet.h5" 
)
"""

# mobilenet
gen_caffe_featuremap(
    "models/alexnet.prototxt", 
    "weights/alexnet.caffemodel", 
    #"/home/alex/imagenet/val/n01632777",
    "/home/alex/imagenet/val",
    "featuremaps/caffe_alexnet.h5" 
)
