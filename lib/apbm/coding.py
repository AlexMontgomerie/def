from operator import itemgetter
from lib.stream import stream
from lib.coding import correlator

def get_code_table(stream_in):
    # table for occurrence of each value
    occ_table = {}
    total_width = stream_in.dtype.bitwidth
    # iterate over stream
    for i in range(stream_in.arr.shape[0]):
        ## add value to occurrence table
        if stream_in.arr[i].to_int() in occ_table:
            occ_table[stream_in.arr[i].to_int()] += 1
        else:
            occ_table[stream_in.arr[i].to_int()]  = 1
    # create code table TODO: fill in unknown values
    scheme = sorted(occ_table.items(), key=itemgetter(1),reverse=True)
    code_table = {}
    # add keys in stream to code table
    for i in range(len(scheme)):
        code_table[scheme[i][0]] = stream_in.dtype(i)
    # add the rest
    codeword = len(scheme)
    for i in range(2**total_width):
        if i in code_table:
            pass
        code_table[i] = stream_in.dtype(i)
        codeword += 1
    # return code table
    return code_table

def get_decode_table(stream_in):
    total_width = stream_in.dtype.bitwidth
    code_table = get_code_table(stream_in)
    decode_table = {}
    for codeword in code_table:
        decode_table[code_table[codeword].to_int()] = stream_in.dtype(codeword)
    return decode_table

def encoder(stream_in, code_table={}):
    # stream initialisations
    stream_out = stream([],dtype=stream_in.dtype)
    # iterate over stream
    for _ in range(stream_in.arr.shape[0]):
        stream_out.push(code_table[stream_in.pop().to_int()])
    # return stream out
    stream_out.queue_to_array()    
    return correlator(stream_out)
 
