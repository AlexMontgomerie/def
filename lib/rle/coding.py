from lib.stream import stream

def encoder(stream_in, rle_zero_symbol=0, rle_zero_val=0):
    # stream initialisations
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    zero_counter = 0
    zero_counter_max = ((2**stream_in.bitwidth)-1)
    for _ in range(stream_in.arr.shape[0]):
        val = stream_in.pop()
        # if the value is not zero
        if val != 0:
            # no zero buffer
            if zero_counter == rle_zero_val:
                stream_out.push(val)
            # zero buffer
            else:
                while zero_counter > zero_counter_max:
                    stream_out.push(rle_zero_symbol)
                    stream_out.push(zero_counter_max)
                    zero_counter -= zero_counter_max
                stream_out.push(rle_zero_symbol)
                stream_out.push(zero_counter)
                stream_out.push(val)
                zero_counter = 0
        # increase zero buffer
        else:
            zero_counter += 1
    # send last zeros out
    if zero_counter != 0:
        while zero_counter > zero_counter_max:
            stream_out.push(rle_zero_symbol)
            stream_out.push(zero_counter_max)
            zero_counter -= zero_counter_max
        stream_out.push(rle_zero_symbol)
        stream_out.push(zero_counter)
        zero_counter = 0
    # return stream out
    stream_out.queue_to_array()    
    return stream_out

def decoder(stream_in, rle_zero_symbol=0, rle_zero_val=0):
    # stream initialisations
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    # iterate over the stream in 
    while stream_in.queue:
        val = stream_in.pop()
        if val == rle_zero_symbol:
             zero_counter = stream_in.pop()
             for i in range(zero_counter):
                 stream_out.push(rle_zero_val)
        else:
            stream_out.push(val)
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
