# DEF: Differential Encoding of Featuremaps for Low Power Convolutional Neural Network Accelerators

DEF is an activity coding scheme that reduces activity along the memory bus for CNN accelerators, reducing dynamic power consumption. This repository contains both software and hardware implementations of the coding scheme, as well as scripts for evaluating DEF against other coding schemes.
This work was accepted for ASP-DAC 2021, and the paper can be found [here](https://www.alexmontgomerie.co.uk/publications/ASPDAC2021_paper.pdf).

## Setup

DEF requires the following:

- python>=3.6
- chisel3

To setup the python environment, run use the `requirements.txt` file with pip.

```
python -m pip install -r requirements 
```

To install chisel3, follow the steps outlined [here](https://github.com/chipsalliance/chisel3). 

## Simulation

This repo contains software implementation of popular coding schemes alongside DEF. These are used to simulate activity and statistics for streaming featuremaps to/from memory. 
The following coding schemes implemented are:

| | |
|:-:|-----|
| [ABE](lib/abe) | Adaptive Bus Encoding |
| [AWR](lib/awr) | Adaptive Word Re-ordering |
| [BI](lib/bi) | Bus Invert coding |
| [Huffman](lib/huffman) | Huffman encoding |
| [PBM](lib/apbm) | Probability Based Mapping |
| [RLE](lib/rle) | Run Length Encoding |

To evaluate the coding schemes, you can use the example script, `scripts/run_featuremap.py`. This runs all coding schemes, generating a report. Example usage is as follows: 

```
python -m scripts.run_featuremap -f {featuremap.h5} -o {output path} -b {bitwidth}
```

Example featuremap files are found in the `featuremaps` folder. They contain each featuremap of a given network, for a random batch of input images.

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
___

Feel free to post an issue if you have any questions or problems!
