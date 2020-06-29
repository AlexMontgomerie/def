import deepdish as dd
import numpy as np
import copy

class sint():
    def __init__(self, bitfield, bitwidth=8, convert=False):

        # setup value
        self.bitwidth = np.uint32(bitwidth)
        self.bitfield = np.uint64(np.uint64(np.uint64(bitfield) & np.uint64(2**(bitwidth)-1) ))

        # signed integer masks
        self.val_mask  = np.uint64( 2**(self.bitwidth-1)-1 )
        self.sign_mask = np.uint64( 1 << (self.bitwidth-1) )

        self.val_max = int(self.val_mask)
        self.val_min = int(-self.val_mask)

        # get signed integer fields
        #self.get_sign = lambda : int( ( self.bitfield & self.sign_mask ) >> ( self.bitwidth - 1 ) )
        #self.get_val  = lambda : int( self.bitfield & self.val_mask )

        # convert if flag given
        if convert:
            self.convert(bitfield)

    # get signed integer fields
    def get_sign(self):
        return int( np.uint64( self.bitfield & self.sign_mask ) >> np.uint64( self.bitwidth - 1 ) )

    def get_val(self):
        return int( self.bitfield & self.val_mask )

    # set signed integer fields
    def set_sign(self,x):
        self.bitfield = np.uint64( np.uint64(self.bitfield) & np.uint64(self.val_mask) ) | np.uint64( np.uint64( np.uint64(x) & np.uint64(1) ) << np.uint64( self.bitwidth - 1 ) ) 

    def set_val(self,x):
        self.bitfield = np.uint64( np.uint64(self.bitfield) & np.uint64(self.sign_mask) ) | np.uint64( np.uint64(x) & np.uint64(self.val_mask) )

    # convert from integer representation
    def convert(self,x):
        
        # set bitfield to zero
        self.bitfield = 0

        # get sign and val
        sign = np.uint64( np.uint64( np.uint64(x) & self.sign_mask ) >> np.uint64( np.uint64(self.bitwidth) - 1 ) )
        val  = np.uint64( np.uint64(x) & self.val_mask )

        # adjust for twos complement
        if sign:
            val = np.uint64( ~val & self.val_mask )
            if val != self.val_mask:
                val += 1

        # set all zeros to regular zero
        if val == 0:
            sign = 0

        # set sign and val
        self.set_sign(sign)
        self.set_val(val)

    # Operator Overloads
    def __invert__(self):
        a = copy.deepcopy(self)
        a.set_val( ~a.get_val() )
        a.set_sign( ~a.get_sign() )
        return a

    def __xor__(self,b):
        # TODO: assert types are the same
        a = copy.deepcopy(self)
        a.set_val( a.get_val() ^ b.get_val() ) 
        a.set_sign( a.get_sign() ^ b.get_sign() ) 
        return a

    def __add__(self,b):
        # TODO: assert types are the same
        # both +ve
        a = copy.deepcopy(self)
        if a.get_sign() == 0 and b.get_sign() == 0:
            a.set_val( a.get_val() + b.get_val() )
            a.set_sign(0)
        # self +ve, x -ve
        elif a.get_sign() == 0 and b.get_sign() == 1:
            if a.get_val() <  b.get_val():
                a.set_val( (b.get_val() - a.get_val()) )
                a.set_sign(1)
            else:
                a.set_val( a.get_val() - b.get_val() )
                a.set_sign(0)
        # self -ve, x +ve
        elif a.get_sign() == 1 and b.get_sign() == 0:
            if b.get_val() <  a.get_val():
                a.set_val( a.get_val() - b.get_val() )
                a.set_sign(1)
            else:
                a.set_val( b.get_val() - a.get_val() )
                a.set_sign(0)
        # both -ve
        elif a.get_sign() == 1 and b.get_sign() == 1:
            a.set_val( a.get_val() + b.get_val() )
            a.set_sign(1)
        # set sign to zero if zero
        if a.get_val() == 0:
            a.set_sign(0)
        return a

    def __sub__(self,b):
        # TODO: assert types are the same
        a = copy.deepcopy(self)
        b.set_sign(~b.get_sign())
        a = a.__add__(b)
        b.set_sign(~b.get_sign())
        return a

    # representation
    def __repr__(self):
        return str( int( self.get_val() * (1-2*self.get_sign()) ) )

    def __str__(self):
        return str( self.__repr__() )

    def to_bin(self):
        bits = bin(self.bitfield).lstrip('0b') 
        return np.array([ * [ 0 ]*(self.bitwidth-len(bits)) , * bits ], dtype=int)

    def to_int(self):
        return int(self.bitfield)

class sint8(sint):
    bitwidth=8
    def __init__(self, bitfield, convert=False):
        sint.__init__(self, bitfield, bitwidth=8,convert=convert)

class sint16(sint):
    bitwidth=16
    def __init__(self, bitfield, convert=False):
        sint.__init__(self, bitfield, bitwidth=16,convert=convert)

class sint32(sint):
    bitwidth=32
    def __init__(self, bitfield, convert=False):
        sint.__init__(self, bitfield, bitwidth=32,convert=convert)

class sint64(sint):
    bitwidth=64
    def __init__(self, bitfield, convert=False):
        sint.__init__(self, bitfield, bitwidth=64,convert=convert)

# function to convert feature map to signed-bit integer
def convert_featuremap(filepath, bitwidth=8):

    # load h5 file
    featuremaps = dd.io.load(filepath)

    # iterate over featuremaps
    featuremaps_converted = {}
    for featuremap in featuremaps:
        featuremaps_converted[featuremap] = featuremaps[featuremap].astype(sint8)
   
    # return the featuremaps
    return featuremaps

if __name__=="__main__":

    # test
    a = sint8(2)
    b = sint8(3)

    #print("2+3 = ", sint8(2).__add__sint8(3))
    #print("2-3 = ", sint8(2).__sub__sint8(3))
    #print("3-2 = ", sint8(3).__sub__sint8(2))
    #print("-3 = ", sint8(-3,convert=True))
    a = sint8(-3,convert=True)
    b = sint8(2)

    tmp = a.__sub__(b)
    print(tmp)
    print(tmp.get_val())
    print("-3-2 = ", tmp )

    a = sint8(-127,convert=True)
    b = sint8(-127,convert=True)
    print(hex(a.to_int()), hex(b.to_int()))
    c = a + b
    d = c - b
    print(hex(c.to_int()))
    print(hex(d.to_int()))

    #print(hex(sint8(-5,convert=True).to_int()))

    #print(convert_featuremap("featuremaps/distiller_alexnet.h5"))
