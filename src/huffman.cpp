#include "common.h"

using namespace std;
using namespace nlohmann;

typedef vector<bool> code_t;
typedef map<uint32_t, code_t> codetable_t;

/*
 * taken from: https://raw.githubusercontent.com/ningke/huffman-codes/master/huffman.cpp
 */

// A Huffman Tree Node
struct HuffmanTree {
    uint32_t c; // character in an alphabet
    int cfreq; // frequency of c.
    struct HuffmanTree *left;
    struct HuffmanTree *right;
    HuffmanTree(uint32_t c, int cfreq, struct HuffmanTree *left=NULL,
                struct HuffmanTree *right=NULL) :
        c(c), cfreq(cfreq), left(left), right(right) {
    }
    ~HuffmanTree() {
        delete left, delete right;
    }
    // Compare two tree nodes
    class Compare {
    public:
        bool operator()(HuffmanTree *a, HuffmanTree *b) {
            return a->cfreq > b->cfreq;
        }
    };
};

/**
 * Builds a Huffman Tree from an input of alphabet C, where C is a vector
 * of (character, frequency) pairs.
 */
HuffmanTree *build_tree(vector< pair<uint32_t, unsigned> > &alph) {
    // First build a min-heap
    // Build leaf nodes first
    priority_queue<HuffmanTree *, vector<HuffmanTree *>, HuffmanTree::Compare > alph_heap;
    for (vector< pair<uint32_t, unsigned> >::iterator it = alph.begin();
         it != alph.end(); ++it) {
        HuffmanTree *leaf = new HuffmanTree(it->first, it->second);
        alph_heap.push(leaf);
    }

    // HuffmanTree algorithm: Merge two lowest weight leaf nodes until
    // only one node is left (root).
    HuffmanTree *root = NULL;
    while (alph_heap.size() > 1) {
        HuffmanTree *l, *r;
        l = alph_heap.top();
        alph_heap.pop();
        r = alph_heap.top();
        alph_heap.pop();
        root = new HuffmanTree(0, l->cfreq + r->cfreq, l, r);
        alph_heap.push(root);
    }

    return root;
}

/**
 * Makes a lookup table (std::map) of (c -> code) from a HuffmanTree, where
 * code is an unsigned long representing the binary code.
 */
codetable_t build_lookup_table(HuffmanTree *htree) {
    codetable_t lookup;
    deque< pair<HuffmanTree *, code_t> > q;

    q.push_back(make_pair(htree, code_t()));
    while (!q.empty()) {
        HuffmanTree *node, *lc, *rc;
        code_t code;
        node = q.front().first;
        code = q.front().second;
        q.pop_front();
        lc = node->left;
        rc = node->right;
        if (lc) {
            // HuffmanTree is always full (either no children or two children)
            // Left child is appended a 0 and right child a 1.
            code_t code_cp(code);
            q.push_back(make_pair(lc, (code.push_back(0), code)));
            q.push_back(make_pair(rc, (code_cp.push_back(1), code_cp)));
        } else {
            // Leaf node: contains the character
            lookup.insert(make_pair(node->c, code));
            /*
            cout << "(" << node->c << ", ";
            for (unsigned i = 0; i < code.size(); i++) {
                cout << code[i];
            }
            cout << ")" << endl;
            */
        }
    }

    return lookup;
}

void encoder(istream &in, ostream &out, int bitwidth, codetable_t code_table) { // TODO: add side channels
   
    // mask
    uint32_t mask = (1<<bitwidth)-1;

    // value buffer
    uint32_t val;

    code_t buffer;

    // iterate over the rest of the stream
    while(in >> val) {
        
        // get code and insert into buffer
        code_t code = code_table[val];
        buffer.insert(buffer.end(), code.begin(), code.end());

        // send to output if overflow
        while( buffer.size() > bitwidth ) {
            uint32_t bitfield = 0;
            for(int i=0; i<bitwidth; i++) {
                bitfield |= (buffer[i] << i);
            }
            out << bitfield << endl;
            buffer.erase(buffer.begin(), buffer.begin()+bitwidth);
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

    int bitwidth = (int) config["bitwidth"];
    vector<pair<uint32_t,unsigned>> frequencies;
    for (auto it = config["frequencies_table"].begin(); it != config["frequencies_table"].end(); ++it) {
        frequencies.push_back(make_pair((uint32_t)atoi(it.key().c_str()),(uint32_t)it.value()));
    }

    // create code tree
    codetable_t code_table = build_lookup_table(build_tree(frequencies));

    // run encoder
    encoder(cin, cout,(int)config["bitwidth"], code_table);

    return 0;
}
