from operator import itemgetter
from lib.quantise import fixed

def get_code_table(stream_in):
    # table for occurrence of each value
    occ_table = {}
    total_width = stream_in.bitwidth
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
        code_table[scheme[i][0]] = fixed(bitfield=i,int_width=stream_in.int_width,frac_width=stream_in.frac_width)
        #code_table[scheme[i][0]] = fixed((i&(2**(total_width-1)-1)),int_width=stream_in.int_width,frac_width=stream_in.frac_width)
        #code_table[scheme[i][0]].sign = float(1- 2*(i >> total_width))
    # add the rest
    """
    codeword = len(scheme)
    for i in range(2**total_width):
        if i in code_table:
            pass
        code_table[i] = fixed((i&(2**(total_width-1)-1)),int_width=stream_in.int_width,frac_width=stream_in.frac_width)
        code_table[i].sign = float(1- 2*(i >> total_width))
        codeword += 1
    """
    # return code table
    return code_table

def get_decode_table(stream_in):
    total_width = stream_in.bitwidth
    code_table = get_code_table(stream_in)
    decode_table = {}
    for codeword in code_table:
        decode_table[code_table[codeword].to_int()] = fixed(bitfield=codeword,int_width=stream_in.int_width,frac_width=stream_in.frac_width)
        #decode_table[code_table[codeword].to_int()] = fixed((codeword&(2**(total_width-1)-1)),int_width=stream_in.int_width,frac_width=stream_in.frac_width)
        #decode_table[code_table[codeword].to_int()].sign = float(1- 2*(codeword >> total_width))
    return decode_table
