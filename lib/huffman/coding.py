from lib.stream import stream
from dahuffman import HuffmanCodec
import math

def get_frequencies_table(arr, bitwidth=8):
    # table for occurrence of each value
    occ_table = {}
    # iterate over stream
    for i in range(arr.shape[0]):
        occ_table[arr[i]] = occ_table.get(arr[i],0)+1
    # add the rest of the entries
    for i in range(2**bitwidth):
        if not (i in occ_table):
            occ_table[i] = 1
    # create huffman code
    occ_table = {str(k):int(v) for k,v in occ_table.items()}
    return occ_table

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

