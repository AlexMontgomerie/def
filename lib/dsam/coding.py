from lib.stream import stream
from lib.coding import correlator
from lib.coding import decorrelator
import copy

def encoder(stream_in, channels=256,use_correlator=True):
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    fifo       = stream([], dtype=stream_in.dtype)
    # fill buffer
    for _ in range(channels):
        val = stream_in.pop()
        fifo.push(val)
        stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-channels):
        val_in    = stream_in.pop()
        val_delay = fifo.pop()
        val_out   = val_in.__sub__(val_delay)
        stream_out.push(val_out)
        fifo.push(val_in)
    stream_out.queue_to_array()    
    # return encoded stream
    if use_correlator:
        return correlator(stream_out)
    else:
        return stream_out

def decoder(stream_in, channels=256,use_correlator=True):
    # decorrelate stream in
    if use_correlator:
        stream_in_decorr = decorrelator(stream_in)
    else:
        stream_in_decorr = stream_in
    #stream_in_decorr = copy.deepcopy(stream_in)
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    fifo       = stream([], dtype=stream_in.dtype)
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


