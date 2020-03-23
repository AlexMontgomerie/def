import numpy as np
import lib.analysis as analysis
import random

import lib.stream   as stream

test_stream = stream.stream(np.random.rand(100)*(2**7))


print(analysis.bitwise_probability(test_stream))
print(analysis.bitwise_variance(test_stream))
