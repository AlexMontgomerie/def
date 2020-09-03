from operator import itemgetter
from lib.stream import stream
from lib.coding import correlator

def get_code_table(arr, bitwidth=8):
    # table for occurrence of each value
    occ_table = {}
    # iterate over stream
    for i in range(arr.shape[0]):
        ## add value to occurrence table
        if arr[i] in occ_table:
            occ_table[arr[i]] += 1
        else:
            occ_table[arr[i]]  = 1
    # create code table TODO: fill in unknown values
    scheme = sorted(occ_table.items(), key=itemgetter(1),reverse=True)
    code_table = [None]*(2**bitwidth) 
    # add keys in stream to code table
    for i in range(len(scheme)):
        code_table[scheme[i][0]] = i
    # add the rest
    codeword = len(scheme)
    for i in range(2**bitwidth):
        if code_table[i] == None:
            code_table[i] = codeword 
            codeword += 1
    # return code table
    return code_table

def get_decode_table(stream_in):
    total_width = stream_in.bitwidth
    code_table = get_code_table(stream_in)
    decode_table = {}
    for codeword in code_table:
        decode_table[code_table[codeword]] = codeword
    return decode_table

def encoder(stream_in, code_table={}):
    # stream initialisations
    stream_out = stream([],bitwidth=stream_in.bitwidth)
    # iterate over stream
    for _ in range(stream_in.arr.shape[0]):
        stream_out.push(code_table[stream_in.pop()])
    # return stream out
    stream_out.queue_to_array()    
    return correlator(stream_out)
 
