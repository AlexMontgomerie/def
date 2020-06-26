from lib.stream import stream
import numpy as np

def hamming_distance(x1,x2):
    return bin(np.uint64(x1) ^ np.uint64(x2)).count('1')

def encoder(stream_in):
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype, sc_width=1)
    fifo       = stream([], dtype=stream_in.dtype)
    # fill buffer
    val = stream_in.pop()
    fifo.push(val)
    stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-1):
        val_in    = stream_in.pop()
        val_delay = fifo.pop()
        val_out   = val_in
        invert    = 0
        if hamming_distance(val_in.to_int(),val_delay.to_int()) > int(stream_in.dtype.bitwidth/2):
            val_out = val_in.__invert__()
            invert  = 1
        stream_out.push(val_out)
        stream_out.sc_push(invert)
        fifo.push(val_out)
    # return stream out
    stream_out.queue_to_array()    
    stream_out.sc_queue_to_array()    
    return stream_out

def decoder(stream_in):
    return stream_in # TODO: implement bi decoder
