from lib.stream import stream

def hamming_distance(x1,x2):
    return bin(x1 ^ x2).count('1')

def encoder(stream_in):
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
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
        if hamming_distance(val_in.to_int(),val_delay.to_int()) > int(stream_in.dtype.bitwidth/2):
            val_out = val_in.__invert__()
        stream_out.push(val_out)
        fifo.push(val_out)
    # return stream out
    stream_out.queue_to_array()    
    return stream_out

def decoder(stream_in):
    # TODO
    return stream_in
