from lib.quantise import fixed
from lib.stream import stream
import copy
import numpy as np

def transition_encoding(stream_in):
    # iterate through stream 
    stream_out = copy.deepcopy(stream_in)
    val = stream_in.pop()
    while val:
        # subtract bias
        stream_out.push(fixed.sub(val,bias))
        val = stream_in.pop()
 

def no_bias(stream_in,bias):
    # convert bias to fixed
    bias = fixed(bias,int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # iterate through stream 
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    for _ in range(stream_in.arr.shape[0]):
        stream_out.push(
            fixed.sub(stream_in.pop(),bias))

    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out

def no_channel_bias(stream_in,channel_bias):
    # convert bias to fixed
    channel_bias = np.array([ 
        fixed(x,int_width=stream_in.int_width,frac_width=stream_in.frac_width) for x in channel_bias])
    # iterate through stream 
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    stream_len = stream_in.arr.shape[0]
    for _ in range(int(stream_in.arr.shape[0]/channel_bias.shape[0])):
        for channel_index in range(channel_bias.shape[0]):
            stream_out.push(
                fixed.sub(stream_in.pop(),channel_bias[channel_index]))
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out

def diff(stream_in):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    fifo       = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # fill buffer
    val = stream_in.pop()
    fifo.push(val)
    stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-1):
        val_in    = stream_in.pop()
        val_delay = fifo.pop()
        stream_out.push(fixed.sub(val_in,val_delay))
        fifo.push(val_in)
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out
 
def channel_diff(stream_in, channels):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    fifo       = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # fill buffer
    for _ in range(channels):
        val = stream_in.pop()
        fifo.push(val)
        stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-channels):
        val_in    = stream_in.pop()
        val_delay = fifo.pop()
        stream_out.push(fixed.sub(val_in,val_delay))
        fifo.push(val_in)
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out

   
