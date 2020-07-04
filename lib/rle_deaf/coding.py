from lib.stream import stream
from lib.coding import correlator
from lib.coding import decorrelator
import lib.rle.coding
import copy

def encoder(stream_in, channels=256, use_correlator=True):
    # zero used in rle
    rle_zero = 1 << (stream_in.bitwidth-1)
    # get the raw length of the stream
    stream_in_length = stream_in.arr.shape[0]
    # perform rle on stream
    stream_rle = lib.rle.coding.encoder(stream_in, rle_zero = rle_zero)
    # stream initialisations
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    fifo       = stream([], bitwidth=stream_in.bitwidth)
    # index of stream_rle relative to stream_in
    index = 0
    # to handle zeros 
    zero_buffer_size  = 0
    zero_buffer_index = 0
    # iterate over the first n_channels to fill buffer
    while index < channels:
        val = stream_rle.pop()
        if val == rle_zero:
            zero_buffer_val = stream_rle.pop()
            zero_buffer_size = zero_buffer_val
            fifo.push(val)
            fifo.push(zero_buffer_val)
            stream_out.push(val)
            stream_out.push(zero_buffer_val)
            index += zero_buffer_size
        else:
            fifo.push(val)
            stream_out.push(val)
            index += 1
    # iterate over rest of stream
    while (index < stream_in_length) and (stream_rle.queue):
        val_in    = stream_rle.pop()
        val_delay = fifo.pop()
        if val_in == rle_zero:
            zero_buffer_val = stream_rle.pop()
            fifo.pop()
            zero_buffer_size = zero_buffer_val
            fifo.push(val_in)
            fifo.push(zero_buffer_val)
            stream_out.push(val_in)
            stream_out.push(zero_buffer_val)
            index += zero_buffer_size
        else:
            val_out = val_in.__sub__(val_delay)
            stream_out.push(val_out)
            fifo.push(val_in)
            index += 1
    stream_out.queue_to_array()    
    # return encoded stream
    if use_correlator:
        return correlator(stream_out)
    else:
        return stream_out

def decoder(stream_in, channels=256):
    # decorrelate stream in
    stream_in_decorr = decorrelator(stream_in)
    # stream initialisations
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    fifo       = stream([], bitwidth=stream_in.bitwidth)
    # fill buffer
    for _ in range(channels):
        val = stream_in_decorr.pop()
        fifo.push(val)
        stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in_decorr.arr.shape[0]-channels):
        val_in    = stream_in_decorr.pop()
        val_delay = fifo.pop()
        val_out   = val_in.__add__(val_delay)
        stream_out.push(val_out)
        fifo.push(val_out)
    stream_out.queue_to_array()    
    # return decoded stream
    return stream_out


