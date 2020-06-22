from lib.stream import stream
from lib.bi.coding import hamming_distance
import math

def encoder(stream_in, N=32): # TODO: add side channel
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    prev_val = 0
    # iterate over stream
    for _ in range(math.floor(stream_in.arr.shape[0]/N)):
        # collect a window
        window = [0]*N
        for i in range(N):
            window[i] = stream_in.pop().bitfield
        # iterate over window
        for i in range(N):
            # get distance of all values with the previous value 
            distances = [ hamming_distance(x,prev_val) for x in window ]
            # find the minimum value index
            _, index = min( (val,idx) for (idx,val) in enumerate(distances) )
            # get from the window
            val = window.pop(index)
            # push to stream
            stream_out.push(stream_in.dtype(val))
            # update previous val
            prev_val = val
    # return stream out
    stream_out.queue_to_array()    
    return stream_out


