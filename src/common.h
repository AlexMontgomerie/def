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

#include "json.hpp"

void decorrelator(std::istream &in, std::ostream &out, int bitwidth);

#endif
