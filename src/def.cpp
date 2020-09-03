#include "common.h"

using namespace std;
using namespace nlohmann;

int int_to_smint(int in, int bitwidth) {

    // mask
    uint32_t val_mask   = (1<<bitwidth)-1;
    uint32_t sign_mask  = (1<<(bitwidth-1));
    
    uint32_t sign = ( (in & sign_mask) >> ( bitwidth - 1 ) ) & 1;
    uint32_t val  = ( (in & val_mask) );
    
    if ( sign && (val!=0) ) {
        val = ( ~val & val_mask ) + 1;
    }

    return (val & val_mask ) | ( sign << (bitwidth-1) ) ;    
}

void encoder(istream &in, ostream &out, int bitwidth, int channels=1) { // TODO: add side channels
   
    // mask
    uint32_t mask = (1<<bitwidth)-1;

    // value buffer
    uint32_t val;

    // queue (depth = channels)
    queue<uint32_t> fifo;

    // fill buffer, and send first value
    for(int i=0; i<channels; i++) {
        in >> val;
        fifo.push(val);
        out << val << endl;
    }

    // iterate over the rest of the stream
    while(in >> val) {
        // get delayed value
        uint32_t val_delay = fifo.front();
        fifo.pop();
        // fill buffer
        fifo.push(val);
        // write difference to output
        out << int_to_smint((val-val_delay), bitwidth) << endl;
    }
}

int main(int argc, char * argv[]) {

    // parameters    
    int opt;
    string config_path;

    while((opt=getopt(argc,argv,"c:")) != -1) {
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

    int bitwidth = (int)config["bitwidth"];
    int channels = (int)config["channels"];

    // run encoder
    stringstream buf;
    encoder(cin, buf, bitwidth, channels);
    decorrelator(buf, cout, bitwidth);

    return 0;
}
