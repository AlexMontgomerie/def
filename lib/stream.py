from collections import deque
from PIL import Image
import numpy as np
import caffe
import random
import sys, os
import glob
import copy

from lib.quantise import fixed

class caffe_stream():

    def __init__(self,name,model_path,weight_path,input_path):
        
        # setup network
        self.name = name
        self.net  = caffe.Classifier(model_path,weight_path)

        # get network batch size
        self.batch_size = self.net.blobs['data'].data[...].shape[0]

        # select random files from 
        #self.image_paths = random.sample(glob.glob(os.path.join(input_path,"*.jpg")),self.batch_size)
        self.image_paths = random.sample(glob.glob(os.path.join(input_path,"*.JPEG")),self.batch_size)

        # run network
        #self.preprocess_fn = lambda x : np.true_divide(x,128) 
        self.preprocess_fn = lambda x : x
        self.run_net()

        # save feature map arrays
        self.feature_maps = {}
        for layer in self.net.blobs:
            self.feature_maps[layer] = self.format_feature_map(self.net.blobs[layer].data[...])
        
        # convert feature map arrays to streams
        self.fm_streams = {}
        for layer in self.feature_maps:
            self.fm_streams[layer] = stream(self.feature_maps[layer])


    def format_feature_map(self, feature_map):
        # 3D feature maps
        if len(feature_map.shape) == 4:
            # change to channel-first
            feature_map = np.moveaxis(feature_map,1,-1)
        # return flattened feature map
        return feature_map.reshape(-1)

    def run_net(self):
        input_blob = np.zeros(self.net.blobs['data'].data[...].shape,dtype=np.float32)
        # load images
        for image_path in self.image_paths:
            # process image
            image = Image.open(image_path)
            shape = self.net.blobs['data'].data[...].shape
            image = image.resize((shape[2],shape[3]),Image.ANTIALIAS)
            image = np.array(image,dtype=np.float32)
            image = self.preprocess_fn(image)
            # append image to input blob
            batch_index = self.image_paths.index(image_path)
            if len(image.shape) == 2:
                input_blob[batch_index] = copy.deepcopy(np.array(image,dtype=np.float32))
            else:
                for channel in range(image.shape[2]):
                    input_blob[batch_index][channel] = copy.deepcopy(np.array(image[:,:,channel],dtype=np.float32))
        # copy input blob into network    
        self.net.blobs['data'].data[...] = copy.deepcopy(input_blob)
        # run network
        self.net.forward()

class stream():

    def __init__(self,arr,int_width=7,frac_width=8):

        # parameters
        self.int_width  = int_width
        self.frac_width = frac_width
        self.bitwidth   = self.int_width+self.frac_width+1

        # stream variables    
        self.arr   = np.array(list(map(lambda x : fixed(val=float(x),int_width=int_width,frac_width=frac_width), arr)))
        self.queue = deque(self.arr)

    def queue_to_array(self):
        self.arr = np.array(list(self.queue))

    def array_to_queue(self):
        self.queue = deque(self.arr)

    def push(self, x):
        self.queue.appendleft(x)

    def pop(self):
        return self.queue.pop()

    @staticmethod
    def check_streams_equal(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        assert a.arr.shape  == b.arr.shape
        for i in range(a.arr.shape[0]):
            assert a.arr[i].to_int() == b.arr[i].to_int(), "ERROR (value) : {} != {}".format(a.arr[i].to_int(),b.arr[i].to_int())

if __name__=="__main__":
    tmp = caffe_stream(
        "lenet",
        "models/alexnet.prototxt",
        "weights/alexnet.caffemodel",
        "/home/alex/mnist"
    )
    
    tmp.fm_streams['data'].bitwise_probability()
    tmp.fm_streams['conv1'].bitwise_probability()
    tmp.fm_streams['pool1'].bitwise_probability()
