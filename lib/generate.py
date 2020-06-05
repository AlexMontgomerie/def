import caffe
from PIL import Image
import numpy as np
import deepdish as dd
import random
import glob
import copy
import os

def gen_caffe_featuremap(model_path, weight_path, input_path, output_path, \
        transform = lambda x : x):
    
    # load network
    net = caffe.Classifier(model_path,weight_path)
    
    # get network batch size
    batch_size = net.blobs['data'].data[...].shape[0]
    
    # select random files from input path
    image_paths = random.sample(glob.glob(os.path.join(input_path,"*.jpg")),batch_size)
    
    # run network
    ## input blob template
    input_blob = np.zeros(net.blobs['data'].data[...].shape,dtype=np.float32)
    ## load images
    for image_path in image_paths:
        ### process image
        image = Image.open(image_path)
        shape = net.blobs['data'].data[...].shape
        image = image.resize((shape[2],shape[3]),Image.ANTIALIAS)
        image = np.array(image,dtype=np.float32)
        image = transform(image)
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

    # function to format caffe feature maps
    def _format_feature_map(feature_map):
        # 3D feature maps
        if len(feature_map.shape) == 4:
            # change to channel-first
            feature_map = np.moveaxis(feature_map,1,-1)
        # return flattened feature map
        return feature_map.reshape(-1)


    # save feature map arrays
    feature_maps = {}
    for layer in net.blobs:
        feature_maps[layer] = _format_feature_map(net.blobs[layer].data[...])

    # write to output
    dd.io.save(output_path, feature_maps)
