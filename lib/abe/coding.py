import math
import lib.analysis
import numpy as np
from lib.stream import stream

def _bin_arr_to_int_arr(arr):
    pass

def encoder(stream_in, window_size=32): # TODO: add spatial and temporal basis and cluster information
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    bitwidth   = stream_in.dtype.bitwidth
    # iterate over stream
    for _ in range(math.floor(stream_in.arr.shape[0]/window_size)):
        ## window cache
        window_cache = np.zeros([window_size,bitwidth],dtype=int)
        ## build up the window
        for w in range(window_size):
            window_cache[w] = stream_in.pop().to_bin()
        ## get the number of switching transitions (per bit line)
        window_transitions = np.bitwise_xor(window_cache[1:,:],window_cache[:-1,:])
        total_transitions  = np.sum(window_transitions)
        ## savings cache
        savings_cache = np.zeros(bitwidth)
        clusters = [[]]*bitwidth
        ## iterate over each bus line
        for i in range(bitwidth): # basis
            combined_transitions = np.zeros([bitwidth,window_size-1],dtype=int)
            for j in range(bitwidth):
                ## skip same busses
                if i == j:
                    continue
                ## get the xor of the two busses
                combined_transitions[j] = np.array( [window_transitions[w,i]*(2*window_transitions[w,j]-window_transitions[w,i]) for w in range(window_size-1)] )
                ## add to cluster
                if np.sum(combined_transitions) > 0:
                    clusters[i].append(j)
            ## find the savings
            savings_cache[i] = np.sum([0.5*(np.sign(combined_transitions[j])+1)*combined_transitions[j] for j in range(bitwidth)])
        ## find basis line
        basis = np.argmax(savings_cache)
        for cluster in clusters[basis]:
            window_cache[:,cluster] = np.bitwise_xor(window_cache[:,cluster],window_cache[:,basis])
        ## send to stream 
        for w in range(window_size):
            ## convert to int
            #val = fixed(int("".join(str(i) for i in window_cache[w,:]), 2),int_width=stream_in.int_width,frac_width=stream_in.frac_width)
            val = stream_in.dtype( int("".join(str(i) for i in window_cache[w,:]), 2) )
            stream_out.push(val)
    # send the last 
    while len(stream_in.queue):
        stream_out.push(stream_in.pop())
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
 
