import numpy as np
import matplotlib.pyplot as plt
import matplotlib.style
import matplotlib as mpl
import numpy as np
import scipy.special

from cycler import cycler
mpl.rcParams['axes.prop_cycle'] = cycler(color='bgrcmyk')

mpl.rcParams['grid.color'] = 'k'
mpl.rcParams['grid.linestyle'] = ':'
mpl.rcParams['grid.linewidth'] = 0.5

mpl.rcParams['figure.figsize'] = [8.0, 6.0]
mpl.rcParams['figure.dpi'] = 80
mpl.rcParams['savefig.dpi'] = 100

mpl.rcParams['font.size'] = 30 
mpl.rcParams['legend.fontsize'] = 'large'
mpl.rcParams['figure.titlesize'] = 'medium'

mpl.rcParams['legend.fancybox'] = False
mpl.rcParams['legend.fontsize'] = 'large'
mpl.rcParams['legend.framealpha'] = None
mpl.rcParams['legend.edgecolor'] = 'inherit'

mpl.rcParams['patch.force_edgecolor'] = True
mpl.rcParams['patch.facecolor'] = 'b'

mpl.rcParams['lines.linewidth'] = 1.0
mpl.rcParams['lines.dashed_pattern'] = [6, 6]
mpl.rcParams['lines.dashdot_pattern'] = [3, 5, 1, 5]
mpl.rcParams['lines.dotted_pattern'] = [1, 3]
mpl.rcParams['lines.scale_dashes'] = False

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

#twos_popcount   = np.array([popcount(x,n=n) for x in twos])
sbint_popcount  = np.array([popcount(x,n=n) for x in sbint])
#plt.bar(twos,twos_popcount, color='red',alpha=0.7, edgecolor="none")
plt.bar(twos,sbint_popcount, color='blue',alpha=0.7,edgecolor="none")
plt.grid(True)
#plt.legend()
plt.show()
