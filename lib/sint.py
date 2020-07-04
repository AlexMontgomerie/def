from lib.stream import stream
import numpy as np

def set_sign(bitfield, sign, bitwidth):
    val_mask  = np.uint64( 2**(bitwidth-1)-1 )
    sign_mask = np.uint64( 1 << (bitwidth-1) )
    return np.uint64( np.uint64(bitfield) & np.uint64(val_mask) ) | np.uint64( np.uint64( np.uint64(sign) & np.uint64(1) ) << np.uint64( bitwidth - 1 ) ) 

def set_val(bitfield, val, bitwidth):
    val_mask  = np.uint64( 2**(bitwidth-1)-1 )
    sign_mask = np.uint64( 1 << (bitwidth-1) )
    return np.uint64( np.uint64(bitfield) & np.uint64(sign_mask) ) | np.uint64( np.uint64(val) & np.uint64(val_mask) )

def stream_int_to_sint(stream_in):
    val_mask  = np.uint64( 2**(stream_in.bitwidth-1)-1 )
    sign_mask = np.uint64( 1 << (stream_in.bitwidth-1) )
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]):
        # read val in from  stream
        stream_in_val = stream_in.pop()
        # set an empty bitfield
        bitfield = 0
        # get sign and val
        sign = np.uint64( np.uint64( np.uint64(stream_in_val) & sign_mask ) >> np.uint64( np.uint64(stream_in.bitwidth) - 1 ) )
        val  = np.uint64( np.uint64(stream_in_val) & val_mask )
        # adjust for twos complement
        if sign:
            val = np.uint64( ~val & val_mask )
            if val != val_mask:
                val += 1
        # set all zeros to regular zero
        if val == 0:
            sign = 0
        # set sign and val
        bitfield = set_sign(bitfield,sign,stream_in.bitwidth)
        bitfield = set_val(bitfield,val,stream_in.bitwidth)
        # push back to stream
        stream_out.push(bitfield)
    # return encoded stream
    stream_out.queue_to_array()    
    return stream_out
 
def stream_sint_to_int(stream_in):
    val_mask  = np.uint64( 2**(stream_in.bitwidth-1)-1 )
    sign_mask = np.uint64( 1 << (stream_in.bitwidth-1) )
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    # iterate over rest of stream
    for _ in range(stream_in.arr.shape[0]):
        # read val in from  stream
        stream_in_val = stream_in.pop()
        # set an empty bitfield
        bitfield = 0
        # get sign and val
        sign = np.uint64( np.uint64( np.uint64(stream_in_val) & sign_mask ) >> np.uint64( np.uint64(stream_in.bitwidth) - 1 ) )
        val  = np.uint64( np.uint64(stream_in_val) & val_mask )
        # adjust for twos complement
        if sign:
            if val == val_mask:
                val = np.uint64( ~val & val_mask )
            else:
                val = np.uint64( ~val & val_mask ) + 1
        # set sign and val
        bitfield = set_sign(bitfield,sign,stream_in.bitwidth)
        bitfield = set_val(bitfield,val,stream_in.bitwidth)
        # push back to stream
        stream_out.push(bitfield)
    # return encoded stream
    stream_out.queue_to_array()    
    return stream_out
 
