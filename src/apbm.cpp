#include "common.h"

using namespace std;
using namespace nlohmann;

void encoder(istream &in, ostream &out, int bitwidth, uint32_t code_table[]) { // TODO: add side channels
   
    // mask
    uint32_t mask = (1<<bitwidth)-1;

    // value buffer
    uint32_t val;

    // iterate over the rest of the stream
    while(in >> val) {
        out << code_table[(val & mask)] << endl;
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
    uint32_t code_table[(1<<bitwidth)];
    copy(config["code_table"].begin(), config["code_table"].end(), code_table);
    
    // run encoder
    stringstream buf;
    encoder(cin, buf, bitwidth, code_table);
    decorrelator(buf, cout, bitwidth);

    return 0;
}
