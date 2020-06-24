from lib.stream import stream
from dahuffman import HuffmanCodec
import lib.bi.coding
import math

def encoder(stream_in, code_table):
    # initialise stream out
    stream_out = stream([], dtype=stream_in.dtype)
    # convert stream to list
    stream_list = []
    for i in range(stream_in.arr.shape[0]):
        stream_list.append(stream_in.arr[i].bitfield)
    # encode using code table
    encoded = code_table.encode(stream_list)
    # iterate over bytes of encoded stream
    encoded_index = 0
    for i in range(math.ceil(len(encoded)/int(stream_in.bitwidth/8))):
        stream_val = 0
        for j in range(int(stream_in.bitwidth/8)):
            if encoded_index < len(encoded):
                stream_val |= ( encoded[encoded_index] << j*8 )
            encoded_index += 1
        stream_out.push(stream_in.dtype(stream_val))
    # return stream out
    stream_out.queue_to_array()    
    return lib.bi.coding.encoder(stream_out)
 