from lib.stream import stream
from lib.coding import correlator

def encoder(stream_in, code_table={}):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # iterate over stream
    for _ in range(stream_in.arr.shape[0]):
        stream_out.push(code_table[stream_in.pop().to_int()])
    # return stream out
    stream_out.queue_to_array()    
    return correlator(stream_out)
 
