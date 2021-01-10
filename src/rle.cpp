#include "common.h"

using namespace std;
using namespace nlohmann;

void encoder(istream &in, ostream &out, int bitwidth, int rle_zero=0) { 

    int zero_counter = 0;
    int zero_counter_max = ((1<<bitwidth)-1);

    // value buffer
    uint32_t val;

    // iterate over the rest of the stream
    while(in >> val) {
        
        if( val != rle_zero ) {
            if( zero_counter == 0 ) {
                out << val << endl;
            } else {
                while( zero_counter > zero_counter_max ) {
                    out << rle_zero << endl;
                    out << zero_counter_max << endl;
                    zero_counter -= zero_counter_max;
                }
                out << rle_zero << endl;
                out << zero_counter << endl;
                out << val << endl;
                zero_counter = 0;
            }
        } else {
            zero_counter++;
        }
    }
    
    // send last zeros out
    if( zero_counter != 0 ) {
        while( zero_counter > zero_counter_max ) {
            out << rle_zero << endl;
            out << zero_counter_max << endl;
            zero_counter -= zero_counter_max;
        }
        out << rle_zero << endl;
        out << zero_counter << endl;
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

    // parameters
    int bitwidth = (int)config["bitwidth"];
    int rle_zero = (int)config["rle_zero"];

    // run encoder
    encoder(cin, cout, bitwidth, rle_zero);

    return 0;
}
