from lib.stream import stream

def encoder(stream_in):
    # stream initialisations
    stream_out = stream([], dtype=stream_in.dtype)
    zero_counter = 0
    for _ in range(stream_in.arr.shape[0]):
        val = stream_in.pop()
        # if the value is not zero
        if val.get_val() != 0:
            # no zero buffer
            if zero_counter == 0:
                stream_out.push(val)
            # zero buffer
            else:
                stream_out.push(stream_in.dtype(0))
                stream_out.push(stream_in.dtype(zero_counter))
                stream_out.push(val)
                zero_counter = 0
        # increase zero buffer
        else:
            zero_counter += 1
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
