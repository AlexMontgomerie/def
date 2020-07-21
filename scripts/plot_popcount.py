import numpy as np
import matplotlib.pyplot as plt

# update stylesheet
plt.style.use('classic')
plt.rcParams['figure.facecolor'] = 'white'

def int2sbint(x,n=8):
    if (x<0) and (x!=-2**(n-1)):
        return ( (-x) | ( 1 << (n-1) ) ) & ( (2**n)-1 )
    else:
        return x

def popcount(x,n=8):
    return bin(x & ( (2**n)-1 )).count('1')

n=16
dtype=np.int16
twos    = np.arange(-2**(n-1),2**(n-1),dtype=dtype)
sbint   = np.array([ int2sbint(x,n=n) for x in twos])  

twos_popcount   = np.array([popcount(x,n=n) for x in twos])
sbint_popcount  = np.array([popcount(x,n=n) for x in sbint])

#plt.semilogx(twos+(2**(n-1)),twos_popcount)
#plt.semilogx(twos+(2**(n-1)),sbint_popcount)
plt.plot(twos,twos_popcount, color='red')
plt.plot(twos,sbint_popcount, color='blue')
#plt.fill_between(twos,twos_popcount,sbint_popcount, facecolor='red', alpha=0.5)
plt.fill_between(twos,0,twos_popcount, facecolor='red', alpha=0.5)
plt.fill_between(twos,0,sbint_popcount, facecolor='blue', alpha=0.5)
#plt.stackplot(twos,twos_popcount,sbint_popcount)
plt.show()

#print(twos_popcount)
print(twos)
#print(sbint_popcount)
print(sbint)
