from lib.quantise import fixed
from lib.stream import stream

def encoder(stream_in):
    # stream initialisations
    stream_out = stream([],int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    zero_counter = 0
    for _ in range(stream_in.arr.shape[0]):
        val = stream_in.pop()
        # if the value is not zero
        if val.to_int() != 0:
            # no zero buffer
            if zero_counter == 0:
                stream_out.push(val)
            # zero buffer
            else:
                stream_out.push(fixed(val=0,int_width=stream_in.int_width,frac_width=stream_in.frac_width))
                stream_out.push(fixed(val=zero_counter,int_width=stream_in.int_width,frac_width=stream_in.frac_width))
                stream_out.push(val)
                zero_counter = 0
        # increase zero buffer
        else:
            zero_counter += 1
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
