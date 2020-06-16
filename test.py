import argparse
import copy
import json
import os

import lib.stream
import lib.analysis
import lib.featuremap
import lib.quantise

import lib.rle.coding
import lib.huffman.coding

limit=100

# load the test featuremap stream
#test_stream = lib.featuremap.to_stream("featuremaps/caffe_alexnet_8b.h5", "conv2", limit=limit, dtype=lib.quantise.sint8)
test_stream = lib.featuremap.to_stream("featuremaps/test.h5", "data", limit=limit, dtype=lib.quantise.sint8)
print(test_stream.arr)

huffman_table = lib.huffman.coding.get_code_table(test_stream)
huffman_stream_encoded = lib.huffman.coding.encoder(copy.deepcopy(test_stream), huffman_table)
print(huffman_stream_encoded.arr)

