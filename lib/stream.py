from collections import deque
import numpy as np

import lib.quantise

class stream():

    def __init__(self, arr, dtype=lib.quantise.sint8, sc_width=0):

        # parameters
        self.bitwidth = dtype.bitwidth
        self.dtype = dtype

        # stream variables    
        self.arr   = np.array(arr, dtype=dtype)
        self.queue = deque(self.arr)

        # side channel
        self.sc_width = sc_width
        self.sc_arr   = np.zeros(self.arr.shape[0], dtype=np.uint32)
        self.sc_queue = deque(self.sc_arr)

    def to_bin(self, output_path):
        # get datatype
        if self.bitwidth <= 64:
            dtype = np.uint64
        elif self.bitwidth <= 32:
            dtype = np.uint32
        elif self.bitwidth <= 16:
            dtype = np.uint16
        elif self.bitwidth <= 8:
            dtype = np.uint8
        # convert array to these datatypes
        arr_out = np.array([x.bitfield for x in self.arr], dtype=dtype)
        # save as binary file
        arr.tofile(output_path)

    # main queue functions
    def queue_to_array(self):
        self.arr = np.array(list(self.queue))

    def array_to_queue(self):
        self.queue = deque(self.arr)

    def push(self, x):
        self.queue.appendleft(x)

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
            assert a.arr[i].bitfield == b.arr[i].bitfield, "ERROR (value) : {} != {}".format(a.arr[i].to_int(),b.arr[i].to_int())


class multi_stream:

    def __init__(self, stream_in, dtype=lib.quantise.sint8, memory_bus_width=32):
        # bus widths
        self.memory_bus_width = memory_bus_width
        # convert the stream in to multi channels
        self.n_channels = int(self.memory_bus_width/stream_in.bitwidth)
        self.multi_channel_arr = stream_in.arr.reshape((self.n_channels,-1),order="F")
        # initialise streams 
        self.streams = [ stream(self.multi_channel_arr[i],dtype=dtype) for i in range(self.n_channels) ]

    def single_stream(self): # TODO: convert to a single wide stream
        dtype = lib.quantise.sint64
        # initialise the stream out
        stream_out = stream([], dtype=dtype)
        # iterate over stream dimensions
        stream_dim = self.streams[0].arr.shape[0]
        for i in range(stream_dim):
            channel_out = dtype(0)
            for j in range(self.n_channels):
                channel_out.bitfield = np.bitwise_or( channel_out.bitfield, np.uint64( np.uint64(self.streams[j].arr[i].bitfield) << np.uint64(j*self.streams[j].bitwidth) ) )
            stream_out.push(channel_out)
        # return stream out
        stream_out.queue_to_array()    
        return stream_out

if __name__=="__main__":
    tmp = featuremaps_to_stream("featuremaps/distiller_resnet18.h5")
