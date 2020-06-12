from collections import deque
import numpy as np

from lib.quantise import sint8

class stream():

    def __init__(self,arr,dtype=sint8):

        # parameters
        self.bitwidth = dtype.bitwidth
        self.dtype = dtype

        # stream variables    
        self.arr   = np.array(arr, dtype=dtype)
        self.queue = deque(self.arr)

    def queue_to_array(self):
        self.arr = np.array(list(self.queue))

    def array_to_queue(self):
        self.queue = deque(self.arr)

    def push(self, x):
        self.queue.appendleft(x)

    def pop(self):
        return self.queue.pop()

    """
    @staticmethod
    def check_streams_equal(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        assert a.arr.shape  == b.arr.shape
        for i in range(a.arr.shape[0]):
            assert a.arr[i].to_int() == b.arr[i].to_int(), "ERROR (value) : {} != {}".format(a.arr[i].to_int(),b.arr[i].to_int())
    """

if __name__=="__main__":
    tmp = featuremaps_to_stream("featuremaps/distiller_resnet18.h5")
