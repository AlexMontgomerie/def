from lib.stream import stream

def encoder(stream_in):
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    zero_counter = 0
    zero_counter_max = ((2**stream_in.bitwidth)-1)
    for _ in range(stream_in.arr.shape[0]):
        val = stream_in.pop()
        # if the value is not zero
        if val.get_val() != 0:
            # no zero buffer
            if zero_counter == 0:
                stream_out.push(val)
            # zero buffer
            else:
                zero = stream_in.dtype(0)
                zero.set_sign(1) # add sign to indicate rle zero
                while zero_counter > zero_counter_max:
                    stream_out.push(zero)
                    stream_out.push(stream_in.dtype(zero_counter_max))
                    zero_counter -= zero_counter_max
                stream_out.push(zero)
                stream_out.push(stream_in.dtype(zero_counter))
                stream_out.push(val)
                zero_counter = 0
        # increase zero buffer
        else:
            zero_counter += 1
    # send last zeros out
    if zero_counter != 0:
        zero = stream_in.dtype(0)
        zero.set_sign(1) # add sign to indicate rle zero
        while zero_counter > zero_counter_max:
            stream_out.push(zero)
            stream_out.push(stream_in.dtype(zero_counter_max))
            zero_counter -= zero_counter_max
        stream_out.push(zero)
        stream_out.push(stream_in.dtype(zero_counter))
        zero_counter = 0
    # return stream out
    stream_out.queue_to_array()    
    return stream_out

def decoder(stream_in):
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    rle_zero = stream_in.dtype(0)
    rle_zero.set_sign(1) # add sign to indicate rle zero
    # iterate over the stream in 
    while stream_in.queue:
        val = stream_in.pop()
        if val.bitfield == rle_zero.bitfield:
             zero_counter = stream_in.pop().bitfield
             for i in range(zero_counter):
                 stream_out.push(stream_in.dtype(0))
        else:
            stream_out.push(val)
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
