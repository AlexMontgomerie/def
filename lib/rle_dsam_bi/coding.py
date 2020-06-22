import lib.rle_dsam.coding
import lib.bi.coding

def encoder(stream_in, channels=256):
    return lib.bi.coding.encoder(lib.rle_dsam.coding.encoder(stream_out,channels=channels))

def decoder(stream_in, channels=256): #TODO
    return stream_in


