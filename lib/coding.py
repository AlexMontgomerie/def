from lib.stream import stream
from lib.quantise import fixed

def correlator(stream_in):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    fifo       = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # fill buffer
    val = stream_in.pop()
    fifo.push(val)
    stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-1):
        val = stream_in.pop()
        val_delay = fifo.pop()
        # convert both to int
        val_out = fixed.xor(val,val_delay)
        stream_out.push(val_out)
        fifo.push(val_out)
    # empty fifo
    fifo.pop()
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out
 
def decorrelator(stream_in):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    fifo       = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # fill buffer
    val = stream_in.pop()
    fifo.push(val)
    stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-1):
        val = stream_in.pop()
        val_delay = fifo.pop()
        # convert both to int
        val_out = fixed.xor(val,val_delay)
        stream_out.push(val_out)
        fifo.push(val)
    # empty fifo
    fifo.pop()
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out
 
