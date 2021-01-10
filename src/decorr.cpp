#include "common.h"

using namespace std;

void decorrelator(istream &in, ostream &out, int bitwidth) {

    // mask
    uint32_t mask = (1<<bitwidth)-1;

    // value buffer
    uint32_t val;

    // queue (depth = channels)
    queue<uint32_t> fifo;

        // fill buffer, and send first value
    in >> val;
    fifo.push(val);
    out << val << endl;

    // iterate over the rest of the stream
    while(in >> val) {
        // get delayed value
        uint32_t val_delay = fifo.front();
        fifo.pop();
        uint32_t val_out = val^val_delay;
        // fill buffer
        fifo.push(val_out);
        // write difference to output
        out << val_out << endl;
    }
}
