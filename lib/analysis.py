import numpy as np

def _stream_to_bin_array(stream_in):
    return np.array([ val.to_bin() for val in stream_in.arr ])

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

def average_switching_activity(stream_in):
    return np.average(_get_transitions(stream_in))

def average_switching_activity_per_line(stream_in):
    return np.average(_get_transitions(stream_in),axis=0)

