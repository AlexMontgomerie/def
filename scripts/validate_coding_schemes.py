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

limit=100000

# load the test featuremap stream
test_stream = lib.featuremap.to_stream("featuremaps/test.h5", "data", limit=limit, dtype=lib.quantise.sint8)

# validate DSAM encoding
dsam_stream_encoded = lib.dsam.coding.encoder(copy.deepcopy(test_stream),channels=3)
dsam_stream_decoded = lib.dsam.coding.decoder(copy.deepcopy(dsam_stream_encoded),channels=3)
lib.stream.stream.check_streams_equal(test_stream,dsam_stream_decoded)
