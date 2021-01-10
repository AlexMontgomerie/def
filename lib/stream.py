from collections import deque
import numpy as np
import math

class stream():

    def __init__(self, arr, bitwidth=8, sc_width=0):

        # parameters
        self.bitwidth = bitwidth
        self.bit_mask = (2**self.bitwidth)-1
        
        # stream variables    
        convert     = np.vectorize( lambda x : np.bitwise_and(np.uint64(x),np.uint64(self.bit_mask)) )
        self.arr    = convert(arr) if np.array(arr).any() else np.array(arr, dtype=np.uint64)
        self.queue  = deque(self.arr)

        # side channel
        self.sc_width = sc_width
        self.sc_arr   = np.zeros(self.arr.shape[0], dtype=np.uint32)
        self.sc_queue = deque(self.sc_arr)

    def to_bin(self, output_path):
        # get datatype
        if self.bitwidth <= 64:
            dtype = np.uint64
        if self.bitwidth <= 32:
            dtype = np.uint32
        if self.bitwidth <= 16:
            dtype = np.uint16
        if self.bitwidth <= 8:
            dtype = np.uint8
        # save as binary file
        with open(output_path,'ab') as f:
            np.save(f,self.arr.astype(dtype))
        #self.arr.astype(dtype).tofile(output_path)

    # main queue functions
    def queue_to_array(self):
        self.arr = np.array(list(self.queue))

    def array_to_queue(self):
        self.queue = deque(self.arr)

    def push(self, x):
        self.queue.appendleft(np.bitwise_and(np.uint64(x),np.uint64(self.bit_mask)))

    def pop(self):
        return self.queue.pop()

    # side channel functions
    def sc_queue_to_array(self):
        self.sc_arr = np.array(list(self.sc_queue))

    def sc_array_to_queue(self):
        self.sc_queue = deque(self.sc_arr)

    def sc_push(self, x):
        self.sc_queue.appendleft(x)

    def sc_pop(self):
        return self.sc_queue.pop()

    @staticmethod
    def check_streams_equal(a,b):
        assert a.arr.shape  == b.arr.shape, "ERROR: {} != {}".format(a.arr.shape,b.arr.shape)
        for i in range(a.arr.shape[0]):
            assert a.arr[i] == b.arr[i], "ERROR (value) : {} != {}".format(a.arr[i],b.arr[i])


