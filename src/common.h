#ifndef COMMON_H_
#define COMMON_H_

#include <iostream>
#include <fstream>
#include <cinttypes>
#include <queue>
#include <cmath>
#include <sstream>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <cassert>
#include <stdexcept>

#include "json.hpp"

void decorrelator(std::istream &in, std::ostream &out, int bitwidth);

#endif
