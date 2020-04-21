from lib.quantise import fixed
from lib.stream import stream
from lib.coding import correlator
from lib.coding import decorrelator

def encoder(stream_in, channels=256):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    fifo       = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # fill buffer
    for _ in range(channels):
        val = stream_in.pop()
        fifo.push(val)
        stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-channels):
        val_in    = stream_in.pop()
        val_delay = fifo.pop()
        stream_out.push(fixed.sub(val_in,val_delay))
        fifo.push(val_in)
    stream_out.queue_to_array()    
    # return encoded stream
    return correlator(stream_out)

def decoder(stream_in, channels=256):
    # decorrelate stream in
    stream_in = decorrelator(stream_in)
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    fifo       = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # fill buffer
    for _ in range(channels):
        val = stream_in.pop()
        fifo.push(val)
        stream_out.push(val)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]-channels):
        val_in    = stream_in.pop()
        val_delay = fifo.pop()
        stream_out.push(fixed.add(val_in,val_delay))
        fifo.push(val_in)
    stream_out.queue_to_array()    
    # return encoded stream
    return stream_out


