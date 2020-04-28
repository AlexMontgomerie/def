from fpbinary import FpBinary
import numpy as np

class fixed():
    def __init__(self,val,int_width=7,frac_width=8): 

        # parameters
        self.int_width  = int_width
        self.frac_width = frac_width
        self.bitwidth   = self.int_width+self.frac_width+1

        # variables
        self.sign = np.sign(val)
        if   type(val) == float:
            self.val     = FpBinary(int_bits=int_width,frac_bits=frac_width,signed=False,value=abs(val))
        elif type(val) == int:
            self.val     = FpBinary(int_bits=int_width,frac_bits=frac_width,signed=False,bit_field=abs(val))
        else:
            raise TypeError
         
        #self.sign = -1.0 if self.val.__lt__(0.0) else 1.0 
        #if self.val == 0.0:
        #    self.sign = 1.0
        
        self.val_raw = val

    def to_bin(self):
        bits = bin(self.val).lstrip('0b') 
        return np.array([ 0 if self.sign == 1.0 else 1 , * [ 0 ]*(self.bitwidth-1-len(bits)) , *bits ], dtype=int)

    def to_int(self):
        return ( self.val.bits_to_signed() & (2**(self.bitwidth-1)-1) ) | ( (0 if self.sign == 1.0 else 1) << (self.bitwidth-1) )

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
        bitwidth = a.bitwidth
        return fixed.from_int_bitfield(~a.to_int(),int_width=a.int_width,frac_width=a.frac_width)

    @staticmethod
    def add(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        a_tmp = FpBinary(int_bits=a.int_width,frac_bits=a.frac_width,signed=True,value=float(a.val)*a.sign)
        b_tmp = FpBinary(int_bits=b.int_width,frac_bits=b.frac_width,signed=True,value=float(b.val)*b.sign)
        return fixed(float(a_tmp+b_tmp),a.int_width,a.frac_width)

    @staticmethod
    def sub(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        a_tmp = FpBinary(int_bits=a.int_width,frac_bits=a.frac_width,signed=True,value=float(a.val)*a.sign)
        b_tmp = FpBinary(int_bits=b.int_width,frac_bits=b.frac_width,signed=True,value=float(b.val)*b.sign)
        return fixed(float(a_tmp-b_tmp),a.int_width,a.frac_width)

    @staticmethod
    def int_add(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        return fixed(int(int(a.sign*a.val.bits_to_signed())+int(b.sign*b.val.bits_to_signed())),a.int_width,a.frac_width)

    @staticmethod
    def int_sub(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        return fixed(int(int(a.sign*a.val.bits_to_signed())-int(b.sign*b.val.bits_to_signed())),a.int_width,a.frac_width)

    @staticmethod
    def xor(a,b):
        assert a.int_width  == b.int_width
        assert a.frac_width == b.frac_width
        out = fixed(int((a.val.bits_to_signed()^b.val.bits_to_signed())),a.int_width,a.frac_width)
        out.sign = float(2*((0 if a.sign == 1.0 else 1)^(0 if b.sign == 1.0 else 1))-1)
        return out


if __name__=="__main__":
    tmp = fixed(0x8000)
    print(hex(tmp.to_int()))
