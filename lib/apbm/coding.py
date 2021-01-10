from operator import itemgetter
from lib.stream import stream

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
        if i in code_table:
            pass
        code_table[i] = i
        codeword += 1
    # return code table
    return code_table


