import matplotlib.pyplot as plt
import numpy as np

import lib.stream   as stream
import lib.encoding as encoding
import lib.analysis as analysis
import lib.coding   as coding
from lib.quantise import fixed

import lib.dsam.coding

import lib.apbm.analysis
import lib.apbm.coding

import lib.abe.coding

tmp = stream.stream(np.random.rand(100)*(2**7),int_width=8,frac_width=8)
#tmp = stream.stream([1,1,1,1,1,1,1,1,1,2,3,4],int_width=8,frac_width=8)
tmp.array_to_queue()
#print([ i.to_int() for i in tmp.arr])
#print([ i.val for i in coding.correlator(tmp).arr])
#print([ i.val for i in coding.decorrelator(coding.correlator(tmp)).arr])
#tmp.array_to_queue()
#print([ i.to_int() for i in lib.dsam.coding.decoder(lib.dsam.coding.encoder(tmp,channels=3),channels=3).arr])
stream.stream.check_streams_equal(tmp, lib.dsam.coding.decoder(lib.dsam.coding.encoder(tmp,channels=3),channels=3))
#print([ i.to_int() for i in lib.dsam.coding.encoder(tmp,channels=3).arr])

print(analysis.average_switching_activity(tmp))
tmp.array_to_queue()

encoded_dsam = lib.dsam.coding.encoder(tmp,channels=10)
print(analysis.average_switching_activity(encoded_dsam))
tmp.array_to_queue()

code_table = lib.apbm.analysis.get_code_table(tmp)
encoded_apbm = lib.apbm.coding.encoder(tmp,code_table)
print(analysis.average_switching_activity(encoded_apbm))
tmp.array_to_queue()

encoded_abe = lib.abe.coding.encoder(tmp)
print(analysis.average_switching_activity(encoded_abe))
tmp.array_to_queue()


