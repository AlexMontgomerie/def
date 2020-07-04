from lib.stream import stream

def correlator(stream_in):
    # stream initialisations
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    fifo       = stream([], bitwidth=stream_in.bitwidth)
    # fill buffer
    val = stream_in.pop()
    fifo.push(val)
    stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-1):
        val = stream_in.pop()
        val_delay = fifo.pop()
        # convert both to int
        val_out = val.__xor__(val_delay)
        stream_out.push(val_out)
        fifo.push(val_out)
    # empty fifo
    fifo.pop()
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out
 
def decorrelator(stream_in):
    # stream initialisations
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    fifo       = stream([], bitwidth=stream_in.bitwidth)
    # fill buffer
    val = stream_in.pop()
    fifo.push(val)
    stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-1):
        val = stream_in.pop()
        val_delay = fifo.pop()
        # convert both to int
        val_out = val.__xor__(val_delay)
        stream_out.push(val_out)
        fifo.push(val)
    # empty fifo
    fifo.pop()
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out
 
