import caffe
from PIL import Image
import numpy as np
import deepdish as dd
import random
import glob
import copy
import os

def gen_caffe_featuremap(model_path, weight_path, input_path, output_path, bitwidth=8, \
        transform = lambda x : x/256):
    
    # load network
    net = caffe.Classifier(model_path,weight_path)
    
    # get network batch size
    batch_size = net.blobs['data'].data[...].shape[0]
    
    # select random files from input path
    image_paths = []
    for _ in range(batch_size):
        # get random directory
        rnd_dir = random.choice(os.listdir(input_path))
        # get random image path
        rnd_image_path = os.path.join(input_path,rnd_dir,random.choice(os.listdir(os.path.join(input_path, rnd_dir))))
        # append to image paths
        image_paths.append(rnd_image_path)

    # run network
    ## input blob template
    input_blob = np.zeros(net.blobs['data'].data[...].shape,dtype=np.float32)
    ## load images
    for image_path in image_paths:
        ### process image
        image = Image.open(image_path).convert("RGB")
        shape = net.blobs['data'].data[...].shape
        image = image.resize((shape[2],shape[3]),Image.ANTIALIAS)
        image = np.array(image,dtype=np.float32)
        image = transform(image)
        ### normalize image
        #image = (image - image.mean(axis=(0,1,2), keepdims=True)) / image.std(axis=(0,1,2), keepdims=True)
        ### append image to input blob
        batch_index = image_paths.index(image_path)
        if len(image.shape) == 2:
            input_blob[batch_index] = copy.deepcopy(np.array(image,dtype=np.float32))
        else:
            for channel in range(image.shape[2]):
                input_blob[batch_index][channel] = copy.deepcopy(np.array(image[:,:,channel],dtype=np.float32))
    ## copy input blob into network    
    net.blobs['data'].data[...] = copy.deepcopy(input_blob)
    ## run network
    net.forward()

    # save feature map arrays
    feature_maps = {}
    for layer in net.blobs:
        feature_maps[layer] = net.blobs[layer].data[...]

    # apply symmetric quantisation to each featuremap
    for layer in feature_maps:
        # get scale for featuremap
        scale = ( 2**(bitwidth-1)-1 ) / ( np.amax(np.abs(feature_maps[layer])) )
        # apply scale to featuremap
        feature_maps[layer] = np.multiply(feature_maps[layer],scale)
        # change data type
        feature_maps[layer] = feature_maps[layer].astype(np.int64)

        print(feature_maps[layer].shape)

    # write to output
    dd.io.save(output_path, feature_maps)

if __name__ == "__main__":
    # 8 bit networks
    gen_caffe_featuremap( "models/alexnet.prototxt", "weights/alexnet.caffemodel", "/home/alex/imagenet/val/", "featuremaps/caffe_alexnet_8b.h5", bitwidth=8 )
    #gen_caffe_featuremap( "models/googlenet.prototxt", "weights/googlenet.caffemodel", "/home/alex/imagenet/val/", "featuremaps/caffe_googlenet_8b.h5", bitwidth=8 )
    # 16 bit networks
    gen_caffe_featuremap( "models/alexnet.prototxt", "weights/alexnet.caffemodel", "/home/alex/imagenet/val/", "featuremaps/caffe_alexnet_16b.h5", bitwidth=16 )
    #gen_caffe_featuremap( "models/googlenet.prototxt", "weights/googlenet.caffemodel", "/home/alex/imagenet/val/", "featuremaps/caffe_googlenet_16b.h5", bitwidth=16 )
