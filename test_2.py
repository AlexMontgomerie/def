import numpy as np
import lib.analysis as analysis
import random
import copy

import lib.stream   as stream

test_stream = stream.stream(np.random.rand(100))

for i in range(test_stream.arr.shape[0]):
    print(hex(test_stream.arr[i].to_int()))

print(analysis.bitwise_probability(test_stream))
print(analysis.bitwise_variance(test_stream))

import lib.dsam.coding as dsam

tmp = dsam.encoder(copy.deepcopy(test_stream), channels=10)
x = dsam.decoder(tmp, channels=10)

for i in range(test_stream.arr.shape[0]):
    print(hex(test_stream.arr[i].to_int()),hex(x.arr[i].to_int()))
