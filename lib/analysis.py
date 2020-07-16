import numpy as np

def to_bin(val, bitwidth=8):
    bits = bin(val).lstrip('0b')
    return np.array([ * [ 0 ]*(bitwidth-len(bits)) , * bits ], dtype=int)
    
def _stream_to_bin_array(stream_in):
    if stream_in.sc_width == 0:
        return np.array([ to_bin(val, bitwidth = stream_in.bitwidth) for val in stream_in.arr ])
    else:
        return np.array([ to_bin(np.uint64( np.uint64(stream_in.arr[i])|np.uint64(stream_in.sc_arr[i]<<stream_in.bitwidth))
            , bitwidth=stream_in.bitwidth+stream_in.sc_width) for i in range(stream_in.arr.shape[0]) ])

def _get_transitions(stream_in):
    bin_stream_in = _stream_to_bin_array(stream_in)
    return np.bitwise_xor(bin_stream_in[1:,:],bin_stream_in[:-1,:])

def bitwise_probability(stream_in):
    return np.average(_stream_to_bin_array(stream_in),axis=0)

def bitwise_mean(stream_in):
    return np.average(_stream_to_bin_array(stream_in),axis=0)

def bitwise_variance(stream_in):
    return np.var(_stream_to_bin_array(stream_in),axis=0)

def total_transitions(stream_in):
    return np.sum(_get_transitions(stream_in))

def total_transitions_per_line(stream_in):
    return np.sum(_get_transitions(stream_in),axis=0)

def total_samples(stream_in):
    return stream_in.arr.shape[0]

def average_switching_activity(stream_in, bitwidth=0):
    if bitwidth:
        return (np.sum(_get_transitions(stream_in))/(bitwidth*stream_in.arr.shape[0]))
    else:
        return np.average(_get_transitions(stream_in))

def average_switching_activity_per_line(stream_in):
    return np.average(_get_transitions(stream_in),axis=0)

