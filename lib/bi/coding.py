from lib.stream import stream
from lib.quantise import fixed

def hamming_distance(x1,x2):
    return bin(x1 ^ x2).count('1')

def encoder(stream_in):
    bitwidth = stream_in.bitwidth
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
        val_out   = val_in
        if hamming_distance(val_in.to_int(),val_delay.to_int()) > int(bitwidth/2):
            val_out = fixed.invert(val_in)
        stream_out.push(val_out)
        fifo.push(val_out)
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
 
