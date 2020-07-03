import numpy as np
import copy

import lib.stream
import lib.analysis
import lib.featuremap
import lib.quantise

import lib.deaf.coding

def Reverse(lst):
    lst.reverse()
    return lst

# create a random array
array_in = np.random.randint(-32,32,size=100)

# save stream in
with open("hw/data/stream_baseline.csv","w") as f:
    f.write(",".join(Reverse([ str(i) for i in array_in])))

# convert to 8 bit sint
sint_convert = np.vectorize( lambda x : lib.quantise.sint8(x,convert=True) )
array_in = sint_convert(array_in)

# convert to a stream
stream_in = lib.stream.stream(array_in.astype(lib.quantise.sint8), dtype=lib.quantise.sint8)

# encode stream
stream_out = lib.deaf.coding.encoder(copy.deepcopy(stream_in), channels=3)

# save output to csv
with open("hw/data/stream_encoded.csv","w") as f:
    f.write(",".join(Reverse([ str(stream_out.arr[i].bitfield) for i in range(stream_out.arr.shape[0]) ])))

