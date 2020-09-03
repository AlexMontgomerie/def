#include "common.h"

using namespace std;
using namespace nlohmann;

int hamming_distance(auto a, auto b) {
    return __builtin_popcount(a^b);
}

void encoder(istream &in, ostream &out, int bitwidth, int N=1) { // TODO: add side channels
   
    // mask
    uint32_t mask = (1<<bitwidth)-1;

    // value buffer
    uint32_t val;
    uint32_t prev_val = 0;

    // iterate over the rest of the stream
    while( !in.eof() ) {
       
        // get a window from stream
        vector<uint32_t> window;
        for(int i=0;i<N;i++) {
            if( in.eof() ) {
                break;
            }
            in >> val;
            window.push_back(val);
        }

        // make a copy of the window
        vector<uint32_t> window_copy(window);
        

        // iterate over window
        for(int i=0; i<window_copy.size(); i++) {
            
            // get minimum distance
            uint32_t min_distance = 0xFFFFFFFF;
            int min_distance_idx = 0;
            for(int j=0; j<window.size(); j++) {
                uint32_t distance = hamming_distance(window[j],prev_val);
                if( distance < min_distance ) {
                    min_distance = distance;
                    min_distance_idx = j;
                } 
            }

            // get the value to transmit
            val = window[min_distance_idx];
            window.erase(window.begin()+min_distance_idx);
            prev_val = val;

            // get side channel index
            int sc_idx = 0;
            for(int j=0; j<window_copy.size(); j++) {
                if( val == window_copy[j] ) {
                    sc_idx = j;
                }
            }

            // transmit value along with index
            out << ( val | (sc_idx << bitwidth) ) << endl;

        }            
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
    int N = (int)config["N"];
    
    printf("starting\n");
    // run encoder
    encoder(cin, cout, bitwidth, N);

    return 0;
}
