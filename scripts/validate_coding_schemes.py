import argparse
import copy
import json
import os

import lib.stream
import lib.analysis
import lib.featuremap
import lib.quantise

import lib.bi.coding
import lib.dsam.coding
import lib.abe.coding
import lib.rle.coding
import lib.apbm.coding
import lib.awr.coding

limit=20

# load the test featuremap stream
test_stream = lib.featuremap.to_stream("featuremaps/test.h5", "data", limit=limit, dtype=lib.quantise.sint8)
    
multi_stream = lib.stream.multi_stream(test_stream, dtype=test_stream.dtype, memory_bus_width=32)
tmp = multi_stream.single_stream()
#print(lib.analysis.bitwise_mean(tmp))

# validate DSAM encoding
dsam_stream_encoded = lib.dsam.coding.encoder(copy.deepcopy(test_stream),channels=3)
dsam_stream_decoded = lib.dsam.coding.decoder(copy.deepcopy(dsam_stream_encoded),channels=3)
lib.stream.stream.check_streams_equal(test_stream,dsam_stream_decoded)

# validate RLE encoding
rle_stream_encoded = lib.rle.coding.encoder(copy.deepcopy(test_stream))
rle_stream_decoded = lib.rle.coding.decoder(copy.deepcopy(rle_stream_encoded))
lib.stream.stream.check_streams_equal(test_stream,rle_stream_decoded)


