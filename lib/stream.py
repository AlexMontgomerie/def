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


class multi_stream:

    def __init__(self, stream_in, bitwidth=8, memory_bus_width=32):

        # bus widths
        self.channel_bitwidth = bitwidth
        self.memory_bus_width = memory_bus_width
        # convert the stream in to multi channels
        self.n_channels = int(self.memory_bus_width/stream_in.bitwidth)
        stream_length = math.floor(stream_in.arr.shape[0]/self.n_channels)*self.n_channels  # find longest stream that is a multiple of the channels
        stream_in.arr = stream_in.arr[0:stream_length] # shorten stream
        self.multi_channel_arr = stream_in.arr.reshape((self.n_channels,-1),order="F")
        # initialise streams 
        self.streams = [ stream(self.multi_channel_arr[i],bitwidth=self.channel_bitwidth) for i in range(self.n_channels) ]

    def single_stream(self): # TODO: convert to a single wide stream
        # initialise the stream out
        stream_out = stream([], bitwidth=self.memory_bus_width)
        # iterate over stream dimensions
        stream_dim = self.streams[0].arr.shape[0]
        for i in range(stream_dim):
            channel_out = np.uint64(0)
            for j in range(self.n_channels):
                # TODO: add side channels
                channel_out = np.bitwise_or( channel_out, np.uint64( np.uint64(self.streams[j].arr[i]) << np.uint64(j*self.streams[j].bitwidth) ) )
            stream_out.push(channel_out)
        # return stream out
        stream_out.queue_to_array()    
        return stream_out

if __name__=="__main__":
    tmp = featuremaps_to_stream("featuremaps/distiller_resnet18.h5")
