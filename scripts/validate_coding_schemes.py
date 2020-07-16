import argparse
import copy
import json
import os

import lib.stream
import lib.analysis
import lib.featuremap
import lib.sint

import lib.bi.coding
import lib.deaf.coding
import lib.abe.coding
import lib.rle.coding
import lib.apbm.coding
import lib.awr.coding

limit=1000

# load the test featuremap stream
featuremap = lib.featuremap.to_stream("featuremaps/test.h5", "data", bitwidth=8)
test_stream = lib.stream.stream(featuremap[0:limit], 8)
#multi_stream = lib.stream.multi_stream(test_stream, dtype=test_stream.dtype, memory_bus_width=32)
#tmp = multi_stream.single_stream()
#print(lib.analysis.bitwise_mean(tmp))

# validate sint encoding
sint_stream_encoded = lib.sint.stream_int_to_sint(copy.deepcopy(test_stream))
sint_stream_decoded = lib.sint.stream_sint_to_int(copy.deepcopy(sint_stream_encoded))
lib.stream.stream.check_streams_equal(test_stream,sint_stream_decoded)

# validate DSAM encoding
deaf_stream_encoded = lib.deaf.coding.encoder(copy.deepcopy(test_stream),channels=3)
deaf_stream_decoded = lib.deaf.coding.decoder(copy.deepcopy(deaf_stream_encoded),channels=3)
lib.stream.stream.check_streams_equal(test_stream,deaf_stream_decoded)

# validate RLE encoding
rle_stream_encoded = lib.rle.coding.encoder(copy.deepcopy(test_stream),rle_zero=0)
rle_stream_decoded = lib.rle.coding.decoder(copy.deepcopy(rle_stream_encoded),rle_zero=0)
lib.stream.stream.check_streams_equal(test_stream,rle_stream_decoded)

