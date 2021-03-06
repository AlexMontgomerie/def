from lib.stream import stream
from dahuffman import HuffmanCodec
import math

def get_code_table(stream_in):
    # table for occurrence of each value
    occ_table = {}
    # iterate over stream
    for i in range(stream_in.arr.shape[0]):
        occ_table[stream_in.arr[i]] = occ_table.get(stream_in.arr[i],0)+1
    # add the rest of the entries
    for i in range(2**stream_in.bitwidth):
        if not (i in occ_table):
            occ_table[i] = 1
    # create huffman code
    return HuffmanCodec.from_frequencies(occ_table)

def encoder(stream_in, code_table):
    # initialise stream out
    stream_out = stream([], bitwidth=stream_in.bitwidth)
    # convert stream to list
    stream_list = []
    for i in range(stream_in.arr.shape[0]):
        stream_list.append(stream_in.arr[i])
    # encode using code table
    encoded = code_table.encode(stream_list)
    encoded = bin(int.from_bytes(encoded,byteorder='big',signed=False)).lstrip('0b')
    # iterate over bytes of encoded stream
    encoded_index = 0
    for i in range(math.floor(len(encoded)/stream_in.bitwidth)):
        stream_val = 0
        for j in range(stream_in.bitwidth):
            stream_val |= ( int(encoded[encoded_index]) << j )
            encoded_index += 1
        stream_out.push(stream_val)
    # return stream out
    stream_out.queue_to_array()    
    return stream_out
 
