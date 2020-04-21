from fpbinary import FpBinary
import numpy as np

class fixed():
    def __init__(self,val,int_width=7,frac_width=8): 

        # parameters
        self.int_width  = int_width
        self.frac_width = frac_width
        self.bitwidth   = self.int_width+self.frac_width+1

        # variables
        self.sign    = np.sign(val)
        if type(val) == float:
            self.val     = FpBinary(int_bits=int_width,frac_bits=frac_width,signed=False,value=abs(val))
        elif type(val) == int:
            self.val     = FpBinary(int_bits=int_width,frac_bits=frac_width,signed=False,bit_field=abs(val))
        else:
            raise TypeError
        self.val_raw = val

    def to_bin(self):
        bits = bin(self.val).lstrip('0b') 
        return np.array([ 0 if self.sign == 1.0 else 1 , * [ 0 ]*(self.bitwidth-1-len(bits)) , *bits ], dtype=int)

    def to_int(self):
        return self.val.bits_to_signed() | ( (0 if self.sign == 1.0 else 1) << (self.bitwidth-1) )

    # operators
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

if __name__=="__main__":
    tmp = fixed(-2.5)
    print(tmp.to_bin())
