from fpbinary import FpBinary
import numpy as np
import copy

class fixed():
    def __init__(self,val=None,bitfield=None,int_width=7,frac_width=8): 

        # parameters
        self.int_width  = int_width
        self.frac_width = frac_width
        self.bitwidth   = self.int_width+self.frac_width+1

        # masks
        self.val_mask  = 2**(self.bitwidth-1)-1
        self.sign_mask = 1 << (self.bitwidth-1)

        # value 
        self.val = 0

        # get fixed point fields
        self.get_sign = lambda : ( self.val & self.sign_mask ) >> ( self.bitwidth - 1 )
        self.get_val  = lambda : self.val & self.val_mask

        # range (as floats)
        self.min_val = (float(self.val_mask)/float(2**self.frac_width)) * -1.0
        self.max_val =  float(self.val_mask)/float(2**self.frac_width)

        # fixed point value
        if bitfield != None:
            self.val = bitfield & ( self.val_mask | self.sign_mask ) 
        elif val != None:
            if type(val) == float:
                self._from_float(val)
            elif type(val) == int:
                self._from_float(float(val))
            else:
                raise TypeError
        else:
            raise ValueError
         
    def set_sign(self,x):
        self.val = ( self.val & self.val_mask ) | ( ( x & 1 ) << ( self.bitwidth - 1 ) ) 

    def set_val(self,x):
        self.val = ( self.val & self.sign_mask ) | ( x & self.val_mask )

    def _from_float(self,val):
        # check if less than min value
        if val < self.min_val:
            self.val = self.val_mask | self.sign_mask
            return
        # check if greater than max value
        if val > self.max_val:
            self.val = self.val_mask 
            return
        # otherwise, quantise
        sign_bit = 1 if val < 0.0 else 0
        uint_val = int( abs( val *  float(2**self.frac_width) ) ) & self.val_mask
        # set values
        self.set_sign(sign_bit)
        self.set_val(uint_val)

    def to_bin(self):
        bits = bin(self.val).lstrip('0b') 
        return np.array([ * [ 0 ]*(self.bitwidth-len(bits)) , * bits ], dtype=int)
        #return np.array([ 0 if self.sign == 1.0 else 1 , * [ 0 ]*(self.bitwidth-1-len(bits)) , *bits ], dtype=int)

    def to_int(self):
        return self.val

    def to_float(self):
        pass

    # class operators
    def __inv__(self):
        self.set_val(~self.get_val())
        self.set_sign(~self.get_sign())

    def __xor__(self,x):
        assert x.int_width  == self.int_width
        assert x.frac_width == self.frac_width
        self.set_val(self.get_val() ^ x.get_val() ) 
        self.set_sign( self.get_sign() ^ x.get_sign() ) 

    def __add__(self,x):
        assert x.int_width  == self.int_width
        assert x.frac_width == self.frac_width
        # both +ve
        if self.get_sign() == 0 and x.get_sign() == 0:
            self.set_val( self.get_val() + x.get_val() )
            self.set_sign(0)
        # self +ve, x -ve
        if self.get_sign() == 0 and x.get_sign() == 1:
            if self.get_val() <  x.get_val():
                self.set_val( x.get_val() - self.get_val() )
                self.set_sign(1)
            else:
                self.set_val( self.get_val() - x.get_val() )
                self.set_sign(0)
        # self -ve, x +ve
        if self.get_sign() == 1 and x.get_sign() == 0:
            if x.get_val() <  self.get_val():
                self.set_val( self.get_val() - x.get_val() )
                self.set_sign(1)
            else:
                self.set_val( x.get_val() - self.get_val() )
                self.set_sign(0)
        # both -ve
        if self.get_sign() == 1 and x.get_sign() == 1:
            self.set_val( self.get_val() + x.get_val() )
            self.set_sign(1)
            

    def __sub__(self,x):
        assert x.int_width  == self.int_width
        assert x.frac_width == self.frac_width
        x.set_sign(~x.get_sign())
        self.__add__(x)
        x.set_sign(~x.get_sign())

    # operators
    @staticmethod
    def from_int_bitfield(val,int_width=7,frac_width=8):
        bitwidth = int_width+frac_width+1
        val_bits = int((val)&(2**(bitwidth-1)-1))
        sign_bit = int(((val)>>(bitwidth-1))&1) 
        out = fixed(val_bits,int_width=int_width,frac_width=frac_width)
        out.sign = float(1 - 2*sign_bit)
        return out 

    def from_bitfield(bitfield,int_width=7,frac_width=8):
        bitwidth = int_width+frac_width+1 
        val = int("".join(str(i) for i in bitfield), 2)
        return fixed.from_int_bitfield(val,int_width=int_width,frac_width=frac_width)

    @staticmethod
    def invert(a):
        tmp = copy.copy(a)
        tmp.__inv__()
        return tmp

    @staticmethod
    def xor(a,b):
        tmp = copy.copy(a)
        tmp.__xor__(b)
        return tmp

    @staticmethod
    def add(a,b):
        tmp = copy.copy(a)
        tmp.__add__(b)
        return tmp

    @staticmethod
    def sub(a,b):
        tmp = copy.copy(a)
        tmp.__sub__(b)
        return tmp

if __name__=="__main__":
    # test init
    print(hex(fixed(val=1.0).to_int()))
    print(hex(fixed(val=-1.0).to_int()))
    print(hex(fixed(val=1000000.0).to_int()))
    print(hex(fixed(val=-1000000.0).to_int()))
    print(hex(fixed(val=0.0000000001).to_int()))
    print(hex(fixed(val=-0.0000000001).to_int()))

    a = fixed(val=1.0)
    b = fixed(val=3)
    print(hex(fixed.invert(a).to_int()))
    print(hex(fixed.xor(a,b).to_int()))
    print(hex(fixed.add(a,b).to_int()))
    print(hex(fixed.sub(a,b).to_int()))
    print(hex(fixed.sub(a,b).to_int()))

