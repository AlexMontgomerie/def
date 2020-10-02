#include "common.h"

using namespace std;
using namespace nlohmann;

int hamming_distance(auto a, auto b) { return __builtin_popcount(a ^ b); }

void encoder(istream &in, ostream &out,
             int bitwidth) { // TODO: add side channels

  // mask
  uint32_t mask = (1 << bitwidth) - 1;

  // value buffer
  uint32_t val;

  // queue (depth = 1)
  queue<uint32_t> fifo;

  // fill buffer, and send first value
  in >> val;
  fifo.push(val);
  out << val << endl;

  // iterate over the rest of the stream
  while (in >> val) {
    // get delayed value
    uint32_t val_delay = fifo.front();
    fifo.pop();
    bool invert = false;
    // check hamming distance
    if (hamming_distance(val, val_delay) > bitwidth / 2) {
      invert = true;
      val = ~val & mask;
    }
    // add side channel signal
    if (invert) {
      val |= 1 << bitwidth;
    }
    fifo.push(val);
    out << val << endl;
  }
}

int main(int argc, char *argv[]) {

  // parameters
  int opt;
  string config_path;

  while ((opt = getopt(argc, argv, "c:")) != -1) {
    switch (opt) {
    case 'c':
      config_path = optarg;
      break;
    }
  }

  // load config
  ifstream config_file(config_path);
  json config;
  config_file >> config;

  // run encoder
  encoder(cin, cout, (int)config["bitwidth"]);

  return 0;
}
