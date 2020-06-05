from collections import deque
import numpy as np
import deepdish as dd
from lib.quantise import fixed

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

# convert h5 file to stream
def featuremaps_to_stream(filepath):

    # load h5 file
    featuremaps = dd.io.load(filepath)

    # convert each feature map into stream
    streams = {}
    for featuremap in featuremaps:
        streams[featuremap] = stream(featuremaps[featuremap])
    
    # return streams
    return streams

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
