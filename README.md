# DEF: Differential Encoding of Featuremaps for Low Power Convolutional Neural Network Accelerators

DEF is an activity coding scheme that reduces activity along the memory bus for CNN accelerators, reducing dynamic power consumption. This repository contains both software and hardware implementations of the coding scheme, as well as scripts for evaluating DEF against other coding schemes.
This work was accepted for ASP-DAC 2021.

## Setup

DEF requires the following:

- python>=3.6
- chisel3

To setup the python environment, run use the `requirements.txt` file with pip.

```
python -m pip install -r requirements 
```

To install chisel3, follow the steps outlined [here](https://github.com/chipsalliance/chisel3). 

## Simuation



## Hardware

A hardware implementation of DEF is found in the `hw` folder. Use the `hw/build_def.sh` script to generate verilog files. You will need to give the bitwidth of the featuremap words and the channel dimension of the featuremap. 

The verilog files are in `hw/impl`.

```
./build_def.sh {channels} {bitwidth}
```

## Citation

If you use DEF in your work, please cite as follows:

```BibTex
@inproceedings{montgomerie-corcoran_def_2021,
	title = {DEF: Differential Encoding of Featuremaps for Low Power Convolutional Neural Network Accelerators},
	booktitle = {2021 26th Asia and South Pacific Design Automation Conference (ASP-DAC)},
	publisher = {ACM},
	author = {Montgomerie-Corcoran, A. and Bouganis, C.},
	year = {2021},
}
```

