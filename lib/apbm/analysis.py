from operator import itemgetter
from lib.quantise import fixed

def get_code_table(stream_in):
    # table for occurrence of each value
    occ_table = {}
    total_width = stream_in.int_width + stream_in.frac_width
    # iterate over stream
    for _ in range(stream_in.arr.shape[0]):
        val_in = stream_in.pop()
        ## add value to occurrence table
        if val_in.to_int() in occ_table:
            occ_table[val_in.to_int()] += 1
        else:
            occ_table[val_in.to_int()]  = 1
    # create code table TODO: fill in unknown values
    scheme = sorted(occ_table.items(), key=itemgetter(1))
    code_table = {}
    for i in range(-1,len(scheme)):
        code_table[scheme[-(i+1)][0]] = fixed((i+1),int_width=stream_in.int_width,frac_width=stream_in.frac_width)
    # return code table
    return code_table
