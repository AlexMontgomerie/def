#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Jul 17 12:41:50 BST 2020
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim deaf_encoder_func_impl -key {Post-Implementation:sim_1:Functional:deaf_encoder} -tclbatch deaf_encoder.tcl -log simulate.log"
xsim deaf_encoder_func_impl -key {Post-Implementation:sim_1:Functional:deaf_encoder} -tclbatch deaf_encoder.tcl -log simulate.log

