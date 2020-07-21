// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Jul 17 12:41:33 2020
// Host        : esperanza running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/alex/DSAM2/hw/impl/project_1/project_1.sim/sim_1/impl/func/xsim/deaf_encoder_func_impl.v
// Design      : deaf_encoder
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Queue
   (S,
    diff_encoder_module_io_out_valid,
    diff_encoder_module_io_in_ready,
    \_T_reg[3] ,
    clock,
    reset,
    Q,
    \deq_ptr_value_reg[0]_0 ,
    _T_1,
    \_T_3_reg[7] );
  output [3:0]S;
  output diff_encoder_module_io_out_valid;
  output diff_encoder_module_io_in_ready;
  output [3:0]\_T_reg[3] ;
  input clock;
  input reset;
  input [0:0]Q;
  input \deq_ptr_value_reg[0]_0 ;
  input _T_1;
  input [7:0]\_T_3_reg[7] ;

  wire [0:0]Q;
  wire [3:0]S;
  wire _T_1;
  wire [7:0]\_T_3_reg[7] ;
  wire [10:0]_T_5;
  wire _T_5_carry__0_i_10_n_0;
  wire _T_5_carry__0_i_11_n_0;
  wire _T_5_carry__0_i_12_n_0;
  wire _T_5_carry__0_i_13_n_0;
  wire _T_5_carry__0_i_14_n_0;
  wire _T_5_carry__0_i_15_n_0;
  wire _T_5_carry__0_i_16_n_0;
  wire _T_5_carry__0_i_17_n_0;
  wire _T_5_carry__0_i_18_n_0;
  wire _T_5_carry__0_i_19_n_0;
  wire _T_5_carry__0_i_20_n_0;
  wire _T_5_carry__0_i_21_n_0;
  wire _T_5_carry__0_i_22_n_0;
  wire _T_5_carry__0_i_23_n_0;
  wire _T_5_carry__0_i_24_n_0;
  wire _T_5_carry__0_i_25_n_0;
  wire _T_5_carry__0_i_26_n_0;
  wire _T_5_carry__0_i_27_n_0;
  wire _T_5_carry__0_i_28_n_0;
  wire _T_5_carry__0_i_29_n_0;
  wire _T_5_carry__0_i_30_n_0;
  wire _T_5_carry__0_i_31_n_0;
  wire _T_5_carry__0_i_32_n_0;
  wire _T_5_carry__0_i_33_n_0;
  wire _T_5_carry__0_i_34_n_0;
  wire _T_5_carry__0_i_35_n_0;
  wire _T_5_carry__0_i_36_n_0;
  wire _T_5_carry__0_i_5_n_0;
  wire _T_5_carry__0_i_6_n_0;
  wire _T_5_carry__0_i_7_n_0;
  wire _T_5_carry__0_i_8_n_0;
  wire _T_5_carry__0_i_9_n_0;
  wire _T_5_carry_i_10_n_0;
  wire _T_5_carry_i_11_n_0;
  wire _T_5_carry_i_12_n_0;
  wire _T_5_carry_i_13_n_0;
  wire _T_5_carry_i_14_n_0;
  wire _T_5_carry_i_15_n_0;
  wire _T_5_carry_i_16_n_0;
  wire _T_5_carry_i_17_n_0;
  wire _T_5_carry_i_18_n_0;
  wire _T_5_carry_i_19_n_0;
  wire _T_5_carry_i_20_n_0;
  wire _T_5_carry_i_21_n_0;
  wire _T_5_carry_i_22_n_0;
  wire _T_5_carry_i_23_n_0;
  wire _T_5_carry_i_24_n_0;
  wire _T_5_carry_i_25_n_0;
  wire _T_5_carry_i_26_n_0;
  wire _T_5_carry_i_27_n_0;
  wire _T_5_carry_i_28_n_0;
  wire _T_5_carry_i_29_n_0;
  wire _T_5_carry_i_30_n_0;
  wire _T_5_carry_i_31_n_0;
  wire _T_5_carry_i_32_n_0;
  wire _T_5_carry_i_33_n_0;
  wire _T_5_carry_i_34_n_0;
  wire _T_5_carry_i_35_n_0;
  wire _T_5_carry_i_36_n_0;
  wire _T_5_carry_i_5_n_0;
  wire _T_5_carry_i_6_n_0;
  wire _T_5_carry_i_7_n_0;
  wire _T_5_carry_i_8_n_0;
  wire _T_5_carry_i_9_n_0;
  wire [10:0]_T_7;
  wire [3:0]\_T_reg[3] ;
  wire clock;
  wire \deq_ptr_value[5]_i_1_n_0 ;
  wire \deq_ptr_value[5]_i_4_n_0 ;
  wire \deq_ptr_value[5]_i_5_n_0 ;
  wire \deq_ptr_value[5]_i_6_n_0 ;
  wire \deq_ptr_value[6]_i_2_n_0 ;
  wire \deq_ptr_value[8]_i_2_n_0 ;
  wire [10:0]deq_ptr_value_reg;
  wire \deq_ptr_value_reg[0]_0 ;
  wire diff_encoder_module_io_in_ready;
  wire diff_encoder_module_io_out_valid;
  wire do_deq;
  wire do_enq;
  wire \enq_ptr_value[10]_i_1_n_0 ;
  wire \enq_ptr_value[10]_i_4_n_0 ;
  wire \enq_ptr_value[10]_i_5_n_0 ;
  wire \enq_ptr_value[10]_i_6_n_0 ;
  wire \enq_ptr_value[7]_i_2_n_0 ;
  wire [10:0]enq_ptr_value_reg;
  wire maybe_full;
  wire maybe_full_i_1_n_0;
  wire ptr_match__3;
  wire ptr_match_carry_i_1_n_0;
  wire ptr_match_carry_i_2_n_0;
  wire ptr_match_carry_i_3_n_0;
  wire ptr_match_carry_i_4_n_0;
  wire ram_reg_0_63_0_2_i_1_n_0;
  wire ram_reg_0_63_0_2_i_2_n_0;
  wire ram_reg_0_63_0_2_n_0;
  wire ram_reg_0_63_0_2_n_1;
  wire ram_reg_0_63_0_2_n_2;
  wire ram_reg_0_63_3_5_n_0;
  wire ram_reg_0_63_3_5_n_1;
  wire ram_reg_0_63_3_5_n_2;
  wire ram_reg_0_63_6_6_n_0;
  wire ram_reg_0_63_7_7_n_0;
  wire ram_reg_1024_1087_0_2_i_1_n_0;
  wire ram_reg_1024_1087_0_2_n_0;
  wire ram_reg_1024_1087_0_2_n_1;
  wire ram_reg_1024_1087_0_2_n_2;
  wire ram_reg_1024_1087_3_5_n_0;
  wire ram_reg_1024_1087_3_5_n_1;
  wire ram_reg_1024_1087_3_5_n_2;
  wire ram_reg_1024_1087_6_6_n_0;
  wire ram_reg_1024_1087_7_7_n_0;
  wire ram_reg_128_191_0_2_i_1_n_0;
  wire ram_reg_128_191_0_2_i_2_n_0;
  wire ram_reg_128_191_0_2_n_0;
  wire ram_reg_128_191_0_2_n_1;
  wire ram_reg_128_191_0_2_n_2;
  wire ram_reg_128_191_3_5_n_0;
  wire ram_reg_128_191_3_5_n_1;
  wire ram_reg_128_191_3_5_n_2;
  wire ram_reg_128_191_6_6_n_0;
  wire ram_reg_128_191_7_7_n_0;
  wire ram_reg_192_255_0_2_i_1_n_0;
  wire ram_reg_192_255_0_2_i_2_n_0;
  wire ram_reg_192_255_0_2_i_3_n_0;
  wire ram_reg_192_255_0_2_n_0;
  wire ram_reg_192_255_0_2_n_1;
  wire ram_reg_192_255_0_2_n_2;
  wire ram_reg_192_255_3_5_n_0;
  wire ram_reg_192_255_3_5_n_1;
  wire ram_reg_192_255_3_5_n_2;
  wire ram_reg_192_255_6_6_n_0;
  wire ram_reg_192_255_7_7_n_0;
  wire ram_reg_256_319_0_2_i_1_n_0;
  wire ram_reg_256_319_0_2_i_2_n_0;
  wire ram_reg_256_319_0_2_n_0;
  wire ram_reg_256_319_0_2_n_1;
  wire ram_reg_256_319_0_2_n_2;
  wire ram_reg_256_319_3_5_n_0;
  wire ram_reg_256_319_3_5_n_1;
  wire ram_reg_256_319_3_5_n_2;
  wire ram_reg_256_319_6_6_n_0;
  wire ram_reg_256_319_7_7_n_0;
  wire ram_reg_320_383_0_2_i_1_n_0;
  wire ram_reg_320_383_0_2_i_2_n_0;
  wire ram_reg_320_383_0_2_n_0;
  wire ram_reg_320_383_0_2_n_1;
  wire ram_reg_320_383_0_2_n_2;
  wire ram_reg_320_383_3_5_n_0;
  wire ram_reg_320_383_3_5_n_1;
  wire ram_reg_320_383_3_5_n_2;
  wire ram_reg_320_383_6_6_n_0;
  wire ram_reg_320_383_7_7_n_0;
  wire ram_reg_384_447_0_2_i_1_n_0;
  wire ram_reg_384_447_0_2_i_2_n_0;
  wire ram_reg_384_447_0_2_n_0;
  wire ram_reg_384_447_0_2_n_1;
  wire ram_reg_384_447_0_2_n_2;
  wire ram_reg_384_447_3_5_n_0;
  wire ram_reg_384_447_3_5_n_1;
  wire ram_reg_384_447_3_5_n_2;
  wire ram_reg_384_447_6_6_n_0;
  wire ram_reg_384_447_7_7_n_0;
  wire ram_reg_448_511_0_2_i_1_n_0;
  wire ram_reg_448_511_0_2_n_0;
  wire ram_reg_448_511_0_2_n_1;
  wire ram_reg_448_511_0_2_n_2;
  wire ram_reg_448_511_3_5_n_0;
  wire ram_reg_448_511_3_5_n_1;
  wire ram_reg_448_511_3_5_n_2;
  wire ram_reg_448_511_6_6_n_0;
  wire ram_reg_448_511_7_7_n_0;
  wire ram_reg_512_575_0_2_i_1_n_0;
  wire ram_reg_512_575_0_2_i_2_n_0;
  wire ram_reg_512_575_0_2_n_0;
  wire ram_reg_512_575_0_2_n_1;
  wire ram_reg_512_575_0_2_n_2;
  wire ram_reg_512_575_3_5_n_0;
  wire ram_reg_512_575_3_5_n_1;
  wire ram_reg_512_575_3_5_n_2;
  wire ram_reg_512_575_6_6_n_0;
  wire ram_reg_512_575_7_7_n_0;
  wire ram_reg_576_639_0_2_i_1_n_0;
  wire ram_reg_576_639_0_2_i_2_n_0;
  wire ram_reg_576_639_0_2_n_0;
  wire ram_reg_576_639_0_2_n_1;
  wire ram_reg_576_639_0_2_n_2;
  wire ram_reg_576_639_3_5_n_0;
  wire ram_reg_576_639_3_5_n_1;
  wire ram_reg_576_639_3_5_n_2;
  wire ram_reg_576_639_6_6_n_0;
  wire ram_reg_576_639_7_7_n_0;
  wire ram_reg_640_703_0_2_i_1_n_0;
  wire ram_reg_640_703_0_2_i_2_n_0;
  wire ram_reg_640_703_0_2_n_0;
  wire ram_reg_640_703_0_2_n_1;
  wire ram_reg_640_703_0_2_n_2;
  wire ram_reg_640_703_3_5_n_0;
  wire ram_reg_640_703_3_5_n_1;
  wire ram_reg_640_703_3_5_n_2;
  wire ram_reg_640_703_6_6_n_0;
  wire ram_reg_640_703_7_7_n_0;
  wire ram_reg_64_127_0_2_i_1_n_0;
  wire ram_reg_64_127_0_2_i_2_n_0;
  wire ram_reg_64_127_0_2_n_0;
  wire ram_reg_64_127_0_2_n_1;
  wire ram_reg_64_127_0_2_n_2;
  wire ram_reg_64_127_3_5_n_0;
  wire ram_reg_64_127_3_5_n_1;
  wire ram_reg_64_127_3_5_n_2;
  wire ram_reg_64_127_6_6_n_0;
  wire ram_reg_64_127_7_7_n_0;
  wire ram_reg_704_767_0_2_i_1_n_0;
  wire ram_reg_704_767_0_2_n_0;
  wire ram_reg_704_767_0_2_n_1;
  wire ram_reg_704_767_0_2_n_2;
  wire ram_reg_704_767_3_5_n_0;
  wire ram_reg_704_767_3_5_n_1;
  wire ram_reg_704_767_3_5_n_2;
  wire ram_reg_704_767_6_6_n_0;
  wire ram_reg_704_767_7_7_n_0;
  wire ram_reg_768_831_0_2_i_1_n_0;
  wire ram_reg_768_831_0_2_i_2_n_0;
  wire ram_reg_768_831_0_2_i_3_n_0;
  wire ram_reg_768_831_0_2_n_0;
  wire ram_reg_768_831_0_2_n_1;
  wire ram_reg_768_831_0_2_n_2;
  wire ram_reg_768_831_3_5_n_0;
  wire ram_reg_768_831_3_5_n_1;
  wire ram_reg_768_831_3_5_n_2;
  wire ram_reg_768_831_6_6_n_0;
  wire ram_reg_768_831_7_7_n_0;
  wire ram_reg_832_895_0_2_i_1_n_0;
  wire ram_reg_832_895_0_2_n_0;
  wire ram_reg_832_895_0_2_n_1;
  wire ram_reg_832_895_0_2_n_2;
  wire ram_reg_832_895_3_5_n_0;
  wire ram_reg_832_895_3_5_n_1;
  wire ram_reg_832_895_3_5_n_2;
  wire ram_reg_832_895_6_6_n_0;
  wire ram_reg_832_895_7_7_n_0;
  wire ram_reg_896_959_0_2_i_1_n_0;
  wire ram_reg_896_959_0_2_i_2_n_0;
  wire ram_reg_896_959_0_2_n_0;
  wire ram_reg_896_959_0_2_n_1;
  wire ram_reg_896_959_0_2_n_2;
  wire ram_reg_896_959_3_5_n_0;
  wire ram_reg_896_959_3_5_n_1;
  wire ram_reg_896_959_3_5_n_2;
  wire ram_reg_896_959_6_6_n_0;
  wire ram_reg_896_959_7_7_n_0;
  wire ram_reg_960_1023_0_2_i_1_n_0;
  wire ram_reg_960_1023_0_2_n_0;
  wire ram_reg_960_1023_0_2_n_1;
  wire ram_reg_960_1023_0_2_n_2;
  wire ram_reg_960_1023_3_5_n_0;
  wire ram_reg_960_1023_3_5_n_1;
  wire ram_reg_960_1023_3_5_n_2;
  wire ram_reg_960_1023_6_6_n_0;
  wire ram_reg_960_1023_7_7_n_0;
  wire reset;
  wire [2:0]NLW_ptr_match_carry_CO_UNCONNECTED;
  wire [3:0]NLW_ptr_match_carry_O_UNCONNECTED;
  wire NLW_ram_reg_0_63_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_0_63_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_0_63_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_0_63_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_1024_1087_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_1024_1087_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_1024_1087_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_1024_1087_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_128_191_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_128_191_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_128_191_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_128_191_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_192_255_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_192_255_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_192_255_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_192_255_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_256_319_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_256_319_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_256_319_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_256_319_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_320_383_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_320_383_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_320_383_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_320_383_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_384_447_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_384_447_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_384_447_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_384_447_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_448_511_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_448_511_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_448_511_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_448_511_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_512_575_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_512_575_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_512_575_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_512_575_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_576_639_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_576_639_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_576_639_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_576_639_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_640_703_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_640_703_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_640_703_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_640_703_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_64_127_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_64_127_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_64_127_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_64_127_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_704_767_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_704_767_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_704_767_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_704_767_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_768_831_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_768_831_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_768_831_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_768_831_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_832_895_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_832_895_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_832_895_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_832_895_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_896_959_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_896_959_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_896_959_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_896_959_7_7_SPO_UNCONNECTED;
  wire NLW_ram_reg_960_1023_0_2_DOD_UNCONNECTED;
  wire NLW_ram_reg_960_1023_3_5_DOD_UNCONNECTED;
  wire NLW_ram_reg_960_1023_6_6_SPO_UNCONNECTED;
  wire NLW_ram_reg_960_1023_7_7_SPO_UNCONNECTED;

  LUT3 #(
    .INIT(8'hF7)) 
    _T_2_i_1
       (.I0(ptr_match__3),
        .I1(maybe_full),
        .I2(_T_1),
        .O(diff_encoder_module_io_in_ready));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h88088888)) 
    _T_4_i_1
       (.I0(_T_1),
        .I1(\deq_ptr_value_reg[0]_0 ),
        .I2(Q),
        .I3(maybe_full),
        .I4(ptr_match__3),
        .O(diff_encoder_module_io_out_valid));
  LUT5 #(
    .INIT(32'hDFD5202A)) 
    _T_5_carry__0_i_1
       (.I0(Q),
        .I1(_T_5_carry__0_i_5_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry__0_i_6_n_0),
        .I4(\_T_3_reg[7] [7]),
        .O(S[3]));
  MUXF8 _T_5_carry__0_i_10
       (.I0(_T_5_carry__0_i_17_n_0),
        .I1(_T_5_carry__0_i_18_n_0),
        .O(_T_5_carry__0_i_10_n_0),
        .S(deq_ptr_value_reg[9]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry__0_i_11
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_3_5_n_1),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry__0_i_11_n_0));
  MUXF8 _T_5_carry__0_i_12
       (.I0(_T_5_carry__0_i_19_n_0),
        .I1(_T_5_carry__0_i_20_n_0),
        .O(_T_5_carry__0_i_12_n_0),
        .S(deq_ptr_value_reg[9]));
  MUXF7 _T_5_carry__0_i_13
       (.I0(_T_5_carry__0_i_21_n_0),
        .I1(_T_5_carry__0_i_22_n_0),
        .O(_T_5_carry__0_i_13_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry__0_i_14
       (.I0(_T_5_carry__0_i_23_n_0),
        .I1(_T_5_carry__0_i_24_n_0),
        .O(_T_5_carry__0_i_14_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry__0_i_15
       (.I0(_T_5_carry__0_i_25_n_0),
        .I1(_T_5_carry__0_i_26_n_0),
        .O(_T_5_carry__0_i_15_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry__0_i_16
       (.I0(_T_5_carry__0_i_27_n_0),
        .I1(_T_5_carry__0_i_28_n_0),
        .O(_T_5_carry__0_i_16_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry__0_i_17
       (.I0(_T_5_carry__0_i_29_n_0),
        .I1(_T_5_carry__0_i_30_n_0),
        .O(_T_5_carry__0_i_17_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry__0_i_18
       (.I0(_T_5_carry__0_i_31_n_0),
        .I1(_T_5_carry__0_i_32_n_0),
        .O(_T_5_carry__0_i_18_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry__0_i_19
       (.I0(_T_5_carry__0_i_33_n_0),
        .I1(_T_5_carry__0_i_34_n_0),
        .O(_T_5_carry__0_i_19_n_0),
        .S(deq_ptr_value_reg[8]));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry__0_i_2
       (.I0(\_T_3_reg[7] [6]),
        .I1(_T_5_carry__0_i_7_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry__0_i_8_n_0),
        .I4(Q),
        .O(S[2]));
  MUXF7 _T_5_carry__0_i_20
       (.I0(_T_5_carry__0_i_35_n_0),
        .I1(_T_5_carry__0_i_36_n_0),
        .O(_T_5_carry__0_i_20_n_0),
        .S(deq_ptr_value_reg[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_21
       (.I0(ram_reg_192_255_7_7_n_0),
        .I1(ram_reg_128_191_7_7_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_7_7_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_7_7_n_0),
        .O(_T_5_carry__0_i_21_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_22
       (.I0(ram_reg_448_511_7_7_n_0),
        .I1(ram_reg_384_447_7_7_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_7_7_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_7_7_n_0),
        .O(_T_5_carry__0_i_22_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_23
       (.I0(ram_reg_704_767_7_7_n_0),
        .I1(ram_reg_640_703_7_7_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_7_7_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_7_7_n_0),
        .O(_T_5_carry__0_i_23_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_24
       (.I0(ram_reg_960_1023_7_7_n_0),
        .I1(ram_reg_896_959_7_7_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_7_7_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_7_7_n_0),
        .O(_T_5_carry__0_i_24_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_25
       (.I0(ram_reg_192_255_6_6_n_0),
        .I1(ram_reg_128_191_6_6_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_6_6_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_6_6_n_0),
        .O(_T_5_carry__0_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_26
       (.I0(ram_reg_448_511_6_6_n_0),
        .I1(ram_reg_384_447_6_6_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_6_6_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_6_6_n_0),
        .O(_T_5_carry__0_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_27
       (.I0(ram_reg_704_767_6_6_n_0),
        .I1(ram_reg_640_703_6_6_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_6_6_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_6_6_n_0),
        .O(_T_5_carry__0_i_27_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_28
       (.I0(ram_reg_960_1023_6_6_n_0),
        .I1(ram_reg_896_959_6_6_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_6_6_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_6_6_n_0),
        .O(_T_5_carry__0_i_28_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_29
       (.I0(ram_reg_192_255_3_5_n_2),
        .I1(ram_reg_128_191_3_5_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_3_5_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_3_5_n_2),
        .O(_T_5_carry__0_i_29_n_0));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry__0_i_3
       (.I0(\_T_3_reg[7] [5]),
        .I1(_T_5_carry__0_i_9_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry__0_i_10_n_0),
        .I4(Q),
        .O(S[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_30
       (.I0(ram_reg_448_511_3_5_n_2),
        .I1(ram_reg_384_447_3_5_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_3_5_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_3_5_n_2),
        .O(_T_5_carry__0_i_30_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_31
       (.I0(ram_reg_704_767_3_5_n_2),
        .I1(ram_reg_640_703_3_5_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_3_5_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_3_5_n_2),
        .O(_T_5_carry__0_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_32
       (.I0(ram_reg_960_1023_3_5_n_2),
        .I1(ram_reg_896_959_3_5_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_3_5_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_3_5_n_2),
        .O(_T_5_carry__0_i_32_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_33
       (.I0(ram_reg_192_255_3_5_n_1),
        .I1(ram_reg_128_191_3_5_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_3_5_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_3_5_n_1),
        .O(_T_5_carry__0_i_33_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_34
       (.I0(ram_reg_448_511_3_5_n_1),
        .I1(ram_reg_384_447_3_5_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_3_5_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_3_5_n_1),
        .O(_T_5_carry__0_i_34_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_35
       (.I0(ram_reg_704_767_3_5_n_1),
        .I1(ram_reg_640_703_3_5_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_3_5_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_3_5_n_1),
        .O(_T_5_carry__0_i_35_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry__0_i_36
       (.I0(ram_reg_960_1023_3_5_n_1),
        .I1(ram_reg_896_959_3_5_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_3_5_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_3_5_n_1),
        .O(_T_5_carry__0_i_36_n_0));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry__0_i_4
       (.I0(\_T_3_reg[7] [4]),
        .I1(_T_5_carry__0_i_11_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry__0_i_12_n_0),
        .I4(Q),
        .O(S[0]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry__0_i_5
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_7_7_n_0),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry__0_i_5_n_0));
  MUXF8 _T_5_carry__0_i_6
       (.I0(_T_5_carry__0_i_13_n_0),
        .I1(_T_5_carry__0_i_14_n_0),
        .O(_T_5_carry__0_i_6_n_0),
        .S(deq_ptr_value_reg[9]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry__0_i_7
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_6_6_n_0),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry__0_i_7_n_0));
  MUXF8 _T_5_carry__0_i_8
       (.I0(_T_5_carry__0_i_15_n_0),
        .I1(_T_5_carry__0_i_16_n_0),
        .O(_T_5_carry__0_i_8_n_0),
        .S(deq_ptr_value_reg[9]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry__0_i_9
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_3_5_n_2),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry__0_i_9_n_0));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry_i_1
       (.I0(\_T_3_reg[7] [3]),
        .I1(_T_5_carry_i_5_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry_i_6_n_0),
        .I4(Q),
        .O(\_T_reg[3] [3]));
  MUXF8 _T_5_carry_i_10
       (.I0(_T_5_carry_i_17_n_0),
        .I1(_T_5_carry_i_18_n_0),
        .O(_T_5_carry_i_10_n_0),
        .S(deq_ptr_value_reg[9]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry_i_11
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_0_2_n_0),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry_i_11_n_0));
  MUXF8 _T_5_carry_i_12
       (.I0(_T_5_carry_i_19_n_0),
        .I1(_T_5_carry_i_20_n_0),
        .O(_T_5_carry_i_12_n_0),
        .S(deq_ptr_value_reg[9]));
  MUXF7 _T_5_carry_i_13
       (.I0(_T_5_carry_i_21_n_0),
        .I1(_T_5_carry_i_22_n_0),
        .O(_T_5_carry_i_13_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry_i_14
       (.I0(_T_5_carry_i_23_n_0),
        .I1(_T_5_carry_i_24_n_0),
        .O(_T_5_carry_i_14_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry_i_15
       (.I0(_T_5_carry_i_25_n_0),
        .I1(_T_5_carry_i_26_n_0),
        .O(_T_5_carry_i_15_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry_i_16
       (.I0(_T_5_carry_i_27_n_0),
        .I1(_T_5_carry_i_28_n_0),
        .O(_T_5_carry_i_16_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry_i_17
       (.I0(_T_5_carry_i_29_n_0),
        .I1(_T_5_carry_i_30_n_0),
        .O(_T_5_carry_i_17_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry_i_18
       (.I0(_T_5_carry_i_31_n_0),
        .I1(_T_5_carry_i_32_n_0),
        .O(_T_5_carry_i_18_n_0),
        .S(deq_ptr_value_reg[8]));
  MUXF7 _T_5_carry_i_19
       (.I0(_T_5_carry_i_33_n_0),
        .I1(_T_5_carry_i_34_n_0),
        .O(_T_5_carry_i_19_n_0),
        .S(deq_ptr_value_reg[8]));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry_i_2
       (.I0(\_T_3_reg[7] [2]),
        .I1(_T_5_carry_i_7_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry_i_8_n_0),
        .I4(Q),
        .O(\_T_reg[3] [2]));
  MUXF7 _T_5_carry_i_20
       (.I0(_T_5_carry_i_35_n_0),
        .I1(_T_5_carry_i_36_n_0),
        .O(_T_5_carry_i_20_n_0),
        .S(deq_ptr_value_reg[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_21
       (.I0(ram_reg_192_255_3_5_n_0),
        .I1(ram_reg_128_191_3_5_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_3_5_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_3_5_n_0),
        .O(_T_5_carry_i_21_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_22
       (.I0(ram_reg_448_511_3_5_n_0),
        .I1(ram_reg_384_447_3_5_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_3_5_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_3_5_n_0),
        .O(_T_5_carry_i_22_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_23
       (.I0(ram_reg_704_767_3_5_n_0),
        .I1(ram_reg_640_703_3_5_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_3_5_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_3_5_n_0),
        .O(_T_5_carry_i_23_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_24
       (.I0(ram_reg_960_1023_3_5_n_0),
        .I1(ram_reg_896_959_3_5_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_3_5_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_3_5_n_0),
        .O(_T_5_carry_i_24_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_25
       (.I0(ram_reg_192_255_0_2_n_2),
        .I1(ram_reg_128_191_0_2_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_0_2_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_0_2_n_2),
        .O(_T_5_carry_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_26
       (.I0(ram_reg_448_511_0_2_n_2),
        .I1(ram_reg_384_447_0_2_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_0_2_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_0_2_n_2),
        .O(_T_5_carry_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_27
       (.I0(ram_reg_704_767_0_2_n_2),
        .I1(ram_reg_640_703_0_2_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_0_2_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_0_2_n_2),
        .O(_T_5_carry_i_27_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_28
       (.I0(ram_reg_960_1023_0_2_n_2),
        .I1(ram_reg_896_959_0_2_n_2),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_0_2_n_2),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_0_2_n_2),
        .O(_T_5_carry_i_28_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_29
       (.I0(ram_reg_192_255_0_2_n_1),
        .I1(ram_reg_128_191_0_2_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_0_2_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_0_2_n_1),
        .O(_T_5_carry_i_29_n_0));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry_i_3
       (.I0(\_T_3_reg[7] [1]),
        .I1(_T_5_carry_i_9_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry_i_10_n_0),
        .I4(Q),
        .O(\_T_reg[3] [1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_30
       (.I0(ram_reg_448_511_0_2_n_1),
        .I1(ram_reg_384_447_0_2_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_0_2_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_0_2_n_1),
        .O(_T_5_carry_i_30_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_31
       (.I0(ram_reg_704_767_0_2_n_1),
        .I1(ram_reg_640_703_0_2_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_0_2_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_0_2_n_1),
        .O(_T_5_carry_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_32
       (.I0(ram_reg_960_1023_0_2_n_1),
        .I1(ram_reg_896_959_0_2_n_1),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_0_2_n_1),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_0_2_n_1),
        .O(_T_5_carry_i_32_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_33
       (.I0(ram_reg_192_255_0_2_n_0),
        .I1(ram_reg_128_191_0_2_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_64_127_0_2_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_0_63_0_2_n_0),
        .O(_T_5_carry_i_33_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_34
       (.I0(ram_reg_448_511_0_2_n_0),
        .I1(ram_reg_384_447_0_2_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_320_383_0_2_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_256_319_0_2_n_0),
        .O(_T_5_carry_i_34_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_35
       (.I0(ram_reg_704_767_0_2_n_0),
        .I1(ram_reg_640_703_0_2_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_576_639_0_2_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_512_575_0_2_n_0),
        .O(_T_5_carry_i_35_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    _T_5_carry_i_36
       (.I0(ram_reg_960_1023_0_2_n_0),
        .I1(ram_reg_896_959_0_2_n_0),
        .I2(deq_ptr_value_reg[7]),
        .I3(ram_reg_832_895_0_2_n_0),
        .I4(deq_ptr_value_reg[6]),
        .I5(ram_reg_768_831_0_2_n_0),
        .O(_T_5_carry_i_36_n_0));
  LUT5 #(
    .INIT(32'h9A95AAAA)) 
    _T_5_carry_i_4
       (.I0(\_T_3_reg[7] [0]),
        .I1(_T_5_carry_i_11_n_0),
        .I2(deq_ptr_value_reg[10]),
        .I3(_T_5_carry_i_12_n_0),
        .I4(Q),
        .O(\_T_reg[3] [0]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry_i_5
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_3_5_n_0),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry_i_5_n_0));
  MUXF8 _T_5_carry_i_6
       (.I0(_T_5_carry_i_13_n_0),
        .I1(_T_5_carry_i_14_n_0),
        .O(_T_5_carry_i_6_n_0),
        .S(deq_ptr_value_reg[9]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry_i_7
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_0_2_n_2),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry_i_7_n_0));
  MUXF8 _T_5_carry_i_8
       (.I0(_T_5_carry_i_15_n_0),
        .I1(_T_5_carry_i_16_n_0),
        .O(_T_5_carry_i_8_n_0),
        .S(deq_ptr_value_reg[9]));
  LUT5 #(
    .INIT(32'h00000010)) 
    _T_5_carry_i_9
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(ram_reg_1024_1087_0_2_n_1),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_5_carry_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \deq_ptr_value[0]_i_1 
       (.I0(deq_ptr_value_reg[0]),
        .O(_T_7[0]));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \deq_ptr_value[10]_i_1 
       (.I0(deq_ptr_value_reg[9]),
        .I1(deq_ptr_value_reg[7]),
        .I2(\deq_ptr_value[8]_i_2_n_0 ),
        .I3(deq_ptr_value_reg[6]),
        .I4(deq_ptr_value_reg[8]),
        .I5(deq_ptr_value_reg[10]),
        .O(_T_7[10]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \deq_ptr_value[1]_i_1 
       (.I0(deq_ptr_value_reg[0]),
        .I1(deq_ptr_value_reg[1]),
        .O(_T_7[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \deq_ptr_value[2]_i_1 
       (.I0(deq_ptr_value_reg[1]),
        .I1(deq_ptr_value_reg[0]),
        .I2(deq_ptr_value_reg[2]),
        .O(_T_7[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \deq_ptr_value[3]_i_1 
       (.I0(deq_ptr_value_reg[2]),
        .I1(deq_ptr_value_reg[0]),
        .I2(deq_ptr_value_reg[1]),
        .I3(deq_ptr_value_reg[3]),
        .O(_T_7[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \deq_ptr_value[4]_i_1 
       (.I0(deq_ptr_value_reg[3]),
        .I1(deq_ptr_value_reg[1]),
        .I2(deq_ptr_value_reg[0]),
        .I3(deq_ptr_value_reg[2]),
        .I4(deq_ptr_value_reg[4]),
        .O(_T_7[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF20220000)) 
    \deq_ptr_value[5]_i_1 
       (.I0(\deq_ptr_value[5]_i_4_n_0 ),
        .I1(\deq_ptr_value[5]_i_5_n_0 ),
        .I2(maybe_full),
        .I3(ptr_match__3),
        .I4(\deq_ptr_value[5]_i_6_n_0 ),
        .I5(reset),
        .O(\deq_ptr_value[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A000000)) 
    \deq_ptr_value[5]_i_2 
       (.I0(_T_1),
        .I1(maybe_full),
        .I2(ptr_match__3),
        .I3(\deq_ptr_value_reg[0]_0 ),
        .I4(Q),
        .O(do_deq));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \deq_ptr_value[5]_i_3 
       (.I0(deq_ptr_value_reg[4]),
        .I1(deq_ptr_value_reg[2]),
        .I2(deq_ptr_value_reg[0]),
        .I3(deq_ptr_value_reg[1]),
        .I4(deq_ptr_value_reg[3]),
        .I5(deq_ptr_value_reg[5]),
        .O(_T_7[5]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \deq_ptr_value[5]_i_4 
       (.I0(deq_ptr_value_reg[2]),
        .I1(deq_ptr_value_reg[3]),
        .I2(deq_ptr_value_reg[0]),
        .I3(deq_ptr_value_reg[1]),
        .I4(deq_ptr_value_reg[5]),
        .I5(deq_ptr_value_reg[4]),
        .O(\deq_ptr_value[5]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \deq_ptr_value[5]_i_5 
       (.I0(Q),
        .I1(\deq_ptr_value_reg[0]_0 ),
        .O(\deq_ptr_value[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \deq_ptr_value[5]_i_6 
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[9]),
        .I2(deq_ptr_value_reg[6]),
        .I3(deq_ptr_value_reg[7]),
        .I4(_T_1),
        .I5(deq_ptr_value_reg[10]),
        .O(\deq_ptr_value[5]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \deq_ptr_value[6]_i_1 
       (.I0(deq_ptr_value_reg[5]),
        .I1(deq_ptr_value_reg[3]),
        .I2(\deq_ptr_value[6]_i_2_n_0 ),
        .I3(deq_ptr_value_reg[4]),
        .I4(deq_ptr_value_reg[6]),
        .O(_T_7[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \deq_ptr_value[6]_i_2 
       (.I0(deq_ptr_value_reg[1]),
        .I1(deq_ptr_value_reg[0]),
        .I2(deq_ptr_value_reg[2]),
        .O(\deq_ptr_value[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \deq_ptr_value[7]_i_1 
       (.I0(deq_ptr_value_reg[6]),
        .I1(deq_ptr_value_reg[4]),
        .I2(\deq_ptr_value[6]_i_2_n_0 ),
        .I3(deq_ptr_value_reg[3]),
        .I4(deq_ptr_value_reg[5]),
        .I5(deq_ptr_value_reg[7]),
        .O(_T_7[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \deq_ptr_value[8]_i_1 
       (.I0(deq_ptr_value_reg[7]),
        .I1(\deq_ptr_value[8]_i_2_n_0 ),
        .I2(deq_ptr_value_reg[6]),
        .I3(deq_ptr_value_reg[8]),
        .O(_T_7[8]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \deq_ptr_value[8]_i_2 
       (.I0(deq_ptr_value_reg[4]),
        .I1(deq_ptr_value_reg[2]),
        .I2(deq_ptr_value_reg[0]),
        .I3(deq_ptr_value_reg[1]),
        .I4(deq_ptr_value_reg[3]),
        .I5(deq_ptr_value_reg[5]),
        .O(\deq_ptr_value[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \deq_ptr_value[9]_i_1 
       (.I0(deq_ptr_value_reg[8]),
        .I1(deq_ptr_value_reg[6]),
        .I2(\deq_ptr_value[8]_i_2_n_0 ),
        .I3(deq_ptr_value_reg[7]),
        .I4(deq_ptr_value_reg[9]),
        .O(_T_7[9]));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[0] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[0]),
        .Q(deq_ptr_value_reg[0]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[10] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[10]),
        .Q(deq_ptr_value_reg[10]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[1] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[1]),
        .Q(deq_ptr_value_reg[1]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[2] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[2]),
        .Q(deq_ptr_value_reg[2]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[3] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[3]),
        .Q(deq_ptr_value_reg[3]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[4] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[4]),
        .Q(deq_ptr_value_reg[4]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[5] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[5]),
        .Q(deq_ptr_value_reg[5]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[6] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[6]),
        .Q(deq_ptr_value_reg[6]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[7] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[7]),
        .Q(deq_ptr_value_reg[7]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[8] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[8]),
        .Q(deq_ptr_value_reg[8]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \deq_ptr_value_reg[9] 
       (.C(clock),
        .CE(do_deq),
        .D(_T_7[9]),
        .Q(deq_ptr_value_reg[9]),
        .R(\deq_ptr_value[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \enq_ptr_value[0]_i_1 
       (.I0(enq_ptr_value_reg[0]),
        .O(_T_5[0]));
  LUT5 #(
    .INIT(32'hFFFF0888)) 
    \enq_ptr_value[10]_i_1 
       (.I0(\enq_ptr_value[10]_i_4_n_0 ),
        .I1(\enq_ptr_value[10]_i_5_n_0 ),
        .I2(ptr_match__3),
        .I3(maybe_full),
        .I4(reset),
        .O(\enq_ptr_value[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h70)) 
    \enq_ptr_value[10]_i_2 
       (.I0(ptr_match__3),
        .I1(maybe_full),
        .I2(_T_1),
        .O(do_enq));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \enq_ptr_value[10]_i_3 
       (.I0(enq_ptr_value_reg[9]),
        .I1(enq_ptr_value_reg[7]),
        .I2(\enq_ptr_value[10]_i_6_n_0 ),
        .I3(enq_ptr_value_reg[6]),
        .I4(enq_ptr_value_reg[8]),
        .I5(enq_ptr_value_reg[10]),
        .O(_T_5[10]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \enq_ptr_value[10]_i_4 
       (.I0(enq_ptr_value_reg[2]),
        .I1(enq_ptr_value_reg[3]),
        .I2(enq_ptr_value_reg[0]),
        .I3(enq_ptr_value_reg[1]),
        .I4(enq_ptr_value_reg[5]),
        .I5(enq_ptr_value_reg[4]),
        .O(\enq_ptr_value[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \enq_ptr_value[10]_i_5 
       (.I0(enq_ptr_value_reg[8]),
        .I1(enq_ptr_value_reg[9]),
        .I2(enq_ptr_value_reg[6]),
        .I3(enq_ptr_value_reg[7]),
        .I4(_T_1),
        .I5(enq_ptr_value_reg[10]),
        .O(\enq_ptr_value[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \enq_ptr_value[10]_i_6 
       (.I0(enq_ptr_value_reg[4]),
        .I1(enq_ptr_value_reg[2]),
        .I2(enq_ptr_value_reg[0]),
        .I3(enq_ptr_value_reg[1]),
        .I4(enq_ptr_value_reg[3]),
        .I5(enq_ptr_value_reg[5]),
        .O(\enq_ptr_value[10]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \enq_ptr_value[1]_i_1 
       (.I0(enq_ptr_value_reg[0]),
        .I1(enq_ptr_value_reg[1]),
        .O(_T_5[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \enq_ptr_value[2]_i_1 
       (.I0(enq_ptr_value_reg[1]),
        .I1(enq_ptr_value_reg[0]),
        .I2(enq_ptr_value_reg[2]),
        .O(_T_5[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \enq_ptr_value[3]_i_1 
       (.I0(enq_ptr_value_reg[2]),
        .I1(enq_ptr_value_reg[0]),
        .I2(enq_ptr_value_reg[1]),
        .I3(enq_ptr_value_reg[3]),
        .O(_T_5[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \enq_ptr_value[4]_i_1 
       (.I0(enq_ptr_value_reg[3]),
        .I1(enq_ptr_value_reg[1]),
        .I2(enq_ptr_value_reg[0]),
        .I3(enq_ptr_value_reg[2]),
        .I4(enq_ptr_value_reg[4]),
        .O(_T_5[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \enq_ptr_value[5]_i_1 
       (.I0(enq_ptr_value_reg[4]),
        .I1(enq_ptr_value_reg[2]),
        .I2(enq_ptr_value_reg[0]),
        .I3(enq_ptr_value_reg[1]),
        .I4(enq_ptr_value_reg[3]),
        .I5(enq_ptr_value_reg[5]),
        .O(_T_5[5]));
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \enq_ptr_value[6]_i_1 
       (.I0(enq_ptr_value_reg[5]),
        .I1(enq_ptr_value_reg[3]),
        .I2(\enq_ptr_value[7]_i_2_n_0 ),
        .I3(enq_ptr_value_reg[4]),
        .I4(enq_ptr_value_reg[6]),
        .O(_T_5[6]));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \enq_ptr_value[7]_i_1 
       (.I0(enq_ptr_value_reg[6]),
        .I1(enq_ptr_value_reg[4]),
        .I2(\enq_ptr_value[7]_i_2_n_0 ),
        .I3(enq_ptr_value_reg[3]),
        .I4(enq_ptr_value_reg[5]),
        .I5(enq_ptr_value_reg[7]),
        .O(_T_5[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \enq_ptr_value[7]_i_2 
       (.I0(enq_ptr_value_reg[1]),
        .I1(enq_ptr_value_reg[0]),
        .I2(enq_ptr_value_reg[2]),
        .O(\enq_ptr_value[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \enq_ptr_value[8]_i_1 
       (.I0(enq_ptr_value_reg[7]),
        .I1(\enq_ptr_value[10]_i_6_n_0 ),
        .I2(enq_ptr_value_reg[6]),
        .I3(enq_ptr_value_reg[8]),
        .O(_T_5[8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \enq_ptr_value[9]_i_1 
       (.I0(enq_ptr_value_reg[8]),
        .I1(enq_ptr_value_reg[6]),
        .I2(\enq_ptr_value[10]_i_6_n_0 ),
        .I3(enq_ptr_value_reg[7]),
        .I4(enq_ptr_value_reg[9]),
        .O(_T_5[9]));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[0] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[0]),
        .Q(enq_ptr_value_reg[0]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[10] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[10]),
        .Q(enq_ptr_value_reg[10]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[1] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[1]),
        .Q(enq_ptr_value_reg[1]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[2] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[2]),
        .Q(enq_ptr_value_reg[2]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[3] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[3]),
        .Q(enq_ptr_value_reg[3]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[4] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[4]),
        .Q(enq_ptr_value_reg[4]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[5] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[5]),
        .Q(enq_ptr_value_reg[5]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[6] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[6]),
        .Q(enq_ptr_value_reg[6]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[7] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[7]),
        .Q(enq_ptr_value_reg[7]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[8] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[8]),
        .Q(enq_ptr_value_reg[8]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enq_ptr_value_reg[9] 
       (.C(clock),
        .CE(do_enq),
        .D(_T_5[9]),
        .Q(enq_ptr_value_reg[9]),
        .R(\enq_ptr_value[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FAABFAA)) 
    maybe_full_i_1
       (.I0(maybe_full),
        .I1(Q),
        .I2(\deq_ptr_value_reg[0]_0 ),
        .I3(_T_1),
        .I4(ptr_match__3),
        .O(maybe_full_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    maybe_full_reg
       (.C(clock),
        .CE(1'b1),
        .D(maybe_full_i_1_n_0),
        .Q(maybe_full),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 ptr_match_carry
       (.CI(1'b0),
        .CO({ptr_match__3,NLW_ptr_match_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ptr_match_carry_O_UNCONNECTED[3:0]),
        .S({ptr_match_carry_i_1_n_0,ptr_match_carry_i_2_n_0,ptr_match_carry_i_3_n_0,ptr_match_carry_i_4_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    ptr_match_carry_i_1
       (.I0(deq_ptr_value_reg[10]),
        .I1(enq_ptr_value_reg[10]),
        .I2(deq_ptr_value_reg[9]),
        .I3(enq_ptr_value_reg[9]),
        .O(ptr_match_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ptr_match_carry_i_2
       (.I0(deq_ptr_value_reg[8]),
        .I1(enq_ptr_value_reg[8]),
        .I2(deq_ptr_value_reg[7]),
        .I3(enq_ptr_value_reg[7]),
        .I4(enq_ptr_value_reg[6]),
        .I5(deq_ptr_value_reg[6]),
        .O(ptr_match_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ptr_match_carry_i_3
       (.I0(deq_ptr_value_reg[5]),
        .I1(enq_ptr_value_reg[5]),
        .I2(deq_ptr_value_reg[4]),
        .I3(enq_ptr_value_reg[4]),
        .I4(enq_ptr_value_reg[3]),
        .I5(deq_ptr_value_reg[3]),
        .O(ptr_match_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ptr_match_carry_i_4
       (.I0(deq_ptr_value_reg[1]),
        .I1(enq_ptr_value_reg[1]),
        .I2(deq_ptr_value_reg[0]),
        .I3(enq_ptr_value_reg[0]),
        .I4(enq_ptr_value_reg[2]),
        .I5(deq_ptr_value_reg[2]),
        .O(ptr_match_carry_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_0_63_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_0_63_0_2_n_0),
        .DOB(ram_reg_0_63_0_2_n_1),
        .DOC(ram_reg_0_63_0_2_n_2),
        .DOD(NLW_ram_reg_0_63_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_0_63_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000070)) 
    ram_reg_0_63_0_2_i_1
       (.I0(ptr_match__3),
        .I1(maybe_full),
        .I2(_T_1),
        .I3(enq_ptr_value_reg[10]),
        .I4(ram_reg_0_63_0_2_i_2_n_0),
        .O(ram_reg_0_63_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    ram_reg_0_63_0_2_i_2
       (.I0(enq_ptr_value_reg[8]),
        .I1(enq_ptr_value_reg[9]),
        .I2(enq_ptr_value_reg[6]),
        .I3(enq_ptr_value_reg[7]),
        .O(ram_reg_0_63_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_0_63_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_0_63_3_5_n_0),
        .DOB(ram_reg_0_63_3_5_n_1),
        .DOC(ram_reg_0_63_3_5_n_2),
        .DOD(NLW_ram_reg_0_63_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_0_63_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_0_63_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_0_63_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_0_63_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_0_63_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_0_63_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_0_63_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_0_63_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1024" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_1024_1087_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_1024_1087_0_2_n_0),
        .DOB(ram_reg_1024_1087_0_2_n_1),
        .DOC(ram_reg_1024_1087_0_2_n_2),
        .DOD(NLW_ram_reg_1024_1087_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_1024_1087_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00002A00)) 
    ram_reg_1024_1087_0_2_i_1
       (.I0(enq_ptr_value_reg[10]),
        .I1(ptr_match__3),
        .I2(maybe_full),
        .I3(_T_1),
        .I4(ram_reg_0_63_0_2_i_2_n_0),
        .O(ram_reg_1024_1087_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1024" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_1024_1087_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_1024_1087_3_5_n_0),
        .DOB(ram_reg_1024_1087_3_5_n_1),
        .DOC(ram_reg_1024_1087_3_5_n_2),
        .DOD(NLW_ram_reg_1024_1087_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_1024_1087_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1024" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_1024_1087_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_1024_1087_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_1024_1087_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_1024_1087_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1024" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_1024_1087_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_1024_1087_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_1024_1087_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_1024_1087_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_128_191_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_128_191_0_2_n_0),
        .DOB(ram_reg_128_191_0_2_n_1),
        .DOC(ram_reg_128_191_0_2_n_2),
        .DOD(NLW_ram_reg_128_191_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_128_191_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00002A00)) 
    ram_reg_128_191_0_2_i_1
       (.I0(enq_ptr_value_reg[7]),
        .I1(ptr_match__3),
        .I2(maybe_full),
        .I3(_T_1),
        .I4(ram_reg_128_191_0_2_i_2_n_0),
        .O(ram_reg_128_191_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    ram_reg_128_191_0_2_i_2
       (.I0(enq_ptr_value_reg[9]),
        .I1(enq_ptr_value_reg[10]),
        .I2(enq_ptr_value_reg[6]),
        .I3(enq_ptr_value_reg[8]),
        .O(ram_reg_128_191_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_128_191_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_128_191_3_5_n_0),
        .DOB(ram_reg_128_191_3_5_n_1),
        .DOC(ram_reg_128_191_3_5_n_2),
        .DOD(NLW_ram_reg_128_191_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_128_191_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_128_191_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_128_191_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_128_191_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_128_191_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_128_191_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_128_191_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_128_191_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_192_255_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_192_255_0_2_n_0),
        .DOB(ram_reg_192_255_0_2_n_1),
        .DOC(ram_reg_192_255_0_2_n_2),
        .DOD(NLW_ram_reg_192_255_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_192_255_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000010001000100)) 
    ram_reg_192_255_0_2_i_1
       (.I0(ram_reg_192_255_0_2_i_2_n_0),
        .I1(ram_reg_192_255_0_2_i_3_n_0),
        .I2(enq_ptr_value_reg[8]),
        .I3(_T_1),
        .I4(maybe_full),
        .I5(ptr_match__3),
        .O(ram_reg_192_255_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ram_reg_192_255_0_2_i_2
       (.I0(enq_ptr_value_reg[10]),
        .I1(enq_ptr_value_reg[9]),
        .O(ram_reg_192_255_0_2_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ram_reg_192_255_0_2_i_3
       (.I0(enq_ptr_value_reg[7]),
        .I1(enq_ptr_value_reg[6]),
        .O(ram_reg_192_255_0_2_i_3_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_192_255_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_192_255_3_5_n_0),
        .DOB(ram_reg_192_255_3_5_n_1),
        .DOC(ram_reg_192_255_3_5_n_2),
        .DOD(NLW_ram_reg_192_255_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_192_255_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_192_255_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_192_255_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_192_255_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_192_255_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_192_255_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_192_255_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_192_255_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_256_319_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_256_319_0_2_n_0),
        .DOB(ram_reg_256_319_0_2_n_1),
        .DOC(ram_reg_256_319_0_2_n_2),
        .DOD(NLW_ram_reg_256_319_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_256_319_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000002A00)) 
    ram_reg_256_319_0_2_i_1
       (.I0(enq_ptr_value_reg[8]),
        .I1(ptr_match__3),
        .I2(maybe_full),
        .I3(_T_1),
        .I4(ram_reg_256_319_0_2_i_2_n_0),
        .I5(ram_reg_192_255_0_2_i_2_n_0),
        .O(ram_reg_256_319_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ram_reg_256_319_0_2_i_2
       (.I0(enq_ptr_value_reg[7]),
        .I1(enq_ptr_value_reg[6]),
        .O(ram_reg_256_319_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_256_319_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_256_319_3_5_n_0),
        .DOB(ram_reg_256_319_3_5_n_1),
        .DOC(ram_reg_256_319_3_5_n_2),
        .DOD(NLW_ram_reg_256_319_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_256_319_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_256_319_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_256_319_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_256_319_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_256_319_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "319" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_256_319_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_256_319_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_256_319_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_256_319_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_320_383_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_320_383_0_2_n_0),
        .DOB(ram_reg_320_383_0_2_n_1),
        .DOC(ram_reg_320_383_0_2_n_2),
        .DOD(NLW_ram_reg_320_383_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_320_383_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000010001000100)) 
    ram_reg_320_383_0_2_i_1
       (.I0(ram_reg_192_255_0_2_i_2_n_0),
        .I1(ram_reg_320_383_0_2_i_2_n_0),
        .I2(enq_ptr_value_reg[7]),
        .I3(_T_1),
        .I4(maybe_full),
        .I5(ptr_match__3),
        .O(ram_reg_320_383_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ram_reg_320_383_0_2_i_2
       (.I0(enq_ptr_value_reg[8]),
        .I1(enq_ptr_value_reg[6]),
        .O(ram_reg_320_383_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_320_383_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_320_383_3_5_n_0),
        .DOB(ram_reg_320_383_3_5_n_1),
        .DOC(ram_reg_320_383_3_5_n_2),
        .DOD(NLW_ram_reg_320_383_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_320_383_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_320_383_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_320_383_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_320_383_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_320_383_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "320" *) 
  (* ram_addr_end = "383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_320_383_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_320_383_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_320_383_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_320_383_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_384_447_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_384_447_0_2_n_0),
        .DOB(ram_reg_384_447_0_2_n_1),
        .DOC(ram_reg_384_447_0_2_n_2),
        .DOD(NLW_ram_reg_384_447_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_384_447_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000010001000100)) 
    ram_reg_384_447_0_2_i_1
       (.I0(ram_reg_192_255_0_2_i_2_n_0),
        .I1(ram_reg_384_447_0_2_i_2_n_0),
        .I2(enq_ptr_value_reg[6]),
        .I3(_T_1),
        .I4(maybe_full),
        .I5(ptr_match__3),
        .O(ram_reg_384_447_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ram_reg_384_447_0_2_i_2
       (.I0(enq_ptr_value_reg[8]),
        .I1(enq_ptr_value_reg[7]),
        .O(ram_reg_384_447_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_384_447_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_384_447_3_5_n_0),
        .DOB(ram_reg_384_447_3_5_n_1),
        .DOC(ram_reg_384_447_3_5_n_2),
        .DOD(NLW_ram_reg_384_447_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_384_447_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_384_447_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_384_447_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_384_447_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_384_447_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "384" *) 
  (* ram_addr_end = "447" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_384_447_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_384_447_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_384_447_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_384_447_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_448_511_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_448_511_0_2_n_0),
        .DOB(ram_reg_448_511_0_2_n_1),
        .DOC(ram_reg_448_511_0_2_n_2),
        .DOD(NLW_ram_reg_448_511_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_448_511_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010101000000000)) 
    ram_reg_448_511_0_2_i_1
       (.I0(ram_reg_192_255_0_2_i_2_n_0),
        .I1(ram_reg_192_255_0_2_i_3_n_0),
        .I2(_T_1),
        .I3(maybe_full),
        .I4(ptr_match__3),
        .I5(enq_ptr_value_reg[8]),
        .O(ram_reg_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_448_511_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_448_511_3_5_n_0),
        .DOB(ram_reg_448_511_3_5_n_1),
        .DOC(ram_reg_448_511_3_5_n_2),
        .DOD(NLW_ram_reg_448_511_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_448_511_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_448_511_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_448_511_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_448_511_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_448_511_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "448" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_448_511_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_448_511_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_448_511_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_448_511_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_512_575_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_512_575_0_2_n_0),
        .DOB(ram_reg_512_575_0_2_n_1),
        .DOC(ram_reg_512_575_0_2_n_2),
        .DOD(NLW_ram_reg_512_575_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_512_575_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000002A00)) 
    ram_reg_512_575_0_2_i_1
       (.I0(enq_ptr_value_reg[9]),
        .I1(ptr_match__3),
        .I2(maybe_full),
        .I3(_T_1),
        .I4(ram_reg_256_319_0_2_i_2_n_0),
        .I5(ram_reg_512_575_0_2_i_2_n_0),
        .O(ram_reg_512_575_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ram_reg_512_575_0_2_i_2
       (.I0(enq_ptr_value_reg[10]),
        .I1(enq_ptr_value_reg[8]),
        .O(ram_reg_512_575_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_512_575_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_512_575_3_5_n_0),
        .DOB(ram_reg_512_575_3_5_n_1),
        .DOC(ram_reg_512_575_3_5_n_2),
        .DOD(NLW_ram_reg_512_575_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_512_575_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_512_575_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_512_575_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_512_575_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_512_575_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "575" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_512_575_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_512_575_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_512_575_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_512_575_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_576_639_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_576_639_0_2_n_0),
        .DOB(ram_reg_576_639_0_2_n_1),
        .DOC(ram_reg_576_639_0_2_n_2),
        .DOD(NLW_ram_reg_576_639_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_576_639_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000010001000100)) 
    ram_reg_576_639_0_2_i_1
       (.I0(ram_reg_512_575_0_2_i_2_n_0),
        .I1(ram_reg_576_639_0_2_i_2_n_0),
        .I2(enq_ptr_value_reg[7]),
        .I3(_T_1),
        .I4(maybe_full),
        .I5(ptr_match__3),
        .O(ram_reg_576_639_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ram_reg_576_639_0_2_i_2
       (.I0(enq_ptr_value_reg[9]),
        .I1(enq_ptr_value_reg[6]),
        .O(ram_reg_576_639_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_576_639_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_576_639_3_5_n_0),
        .DOB(ram_reg_576_639_3_5_n_1),
        .DOC(ram_reg_576_639_3_5_n_2),
        .DOD(NLW_ram_reg_576_639_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_576_639_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_576_639_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_576_639_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_576_639_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_576_639_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "576" *) 
  (* ram_addr_end = "639" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_576_639_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_576_639_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_576_639_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_576_639_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_640_703_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_640_703_0_2_n_0),
        .DOB(ram_reg_640_703_0_2_n_1),
        .DOC(ram_reg_640_703_0_2_n_2),
        .DOD(NLW_ram_reg_640_703_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_640_703_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000010001000100)) 
    ram_reg_640_703_0_2_i_1
       (.I0(ram_reg_512_575_0_2_i_2_n_0),
        .I1(ram_reg_640_703_0_2_i_2_n_0),
        .I2(enq_ptr_value_reg[6]),
        .I3(_T_1),
        .I4(maybe_full),
        .I5(ptr_match__3),
        .O(ram_reg_640_703_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ram_reg_640_703_0_2_i_2
       (.I0(enq_ptr_value_reg[9]),
        .I1(enq_ptr_value_reg[7]),
        .O(ram_reg_640_703_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_640_703_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_640_703_3_5_n_0),
        .DOB(ram_reg_640_703_3_5_n_1),
        .DOC(ram_reg_640_703_3_5_n_2),
        .DOD(NLW_ram_reg_640_703_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_640_703_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_640_703_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_640_703_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_640_703_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_640_703_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "640" *) 
  (* ram_addr_end = "703" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_640_703_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_640_703_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_640_703_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_640_703_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_64_127_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_64_127_0_2_n_0),
        .DOB(ram_reg_64_127_0_2_n_1),
        .DOC(ram_reg_64_127_0_2_n_2),
        .DOD(NLW_ram_reg_64_127_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_64_127_0_2_i_1_n_0));
  LUT5 #(
    .INIT(32'h00002A00)) 
    ram_reg_64_127_0_2_i_1
       (.I0(enq_ptr_value_reg[6]),
        .I1(ptr_match__3),
        .I2(maybe_full),
        .I3(_T_1),
        .I4(ram_reg_64_127_0_2_i_2_n_0),
        .O(ram_reg_64_127_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    ram_reg_64_127_0_2_i_2
       (.I0(enq_ptr_value_reg[9]),
        .I1(enq_ptr_value_reg[10]),
        .I2(enq_ptr_value_reg[7]),
        .I3(enq_ptr_value_reg[8]),
        .O(ram_reg_64_127_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_64_127_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_64_127_3_5_n_0),
        .DOB(ram_reg_64_127_3_5_n_1),
        .DOC(ram_reg_64_127_3_5_n_2),
        .DOD(NLW_ram_reg_64_127_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_64_127_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_64_127_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_64_127_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_64_127_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_64_127_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_64_127_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_64_127_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_64_127_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_704_767_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_704_767_0_2_n_0),
        .DOB(ram_reg_704_767_0_2_n_1),
        .DOC(ram_reg_704_767_0_2_n_2),
        .DOD(NLW_ram_reg_704_767_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_704_767_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010101000000000)) 
    ram_reg_704_767_0_2_i_1
       (.I0(ram_reg_512_575_0_2_i_2_n_0),
        .I1(ram_reg_192_255_0_2_i_3_n_0),
        .I2(_T_1),
        .I3(maybe_full),
        .I4(ptr_match__3),
        .I5(enq_ptr_value_reg[9]),
        .O(ram_reg_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_704_767_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_704_767_3_5_n_0),
        .DOB(ram_reg_704_767_3_5_n_1),
        .DOC(ram_reg_704_767_3_5_n_2),
        .DOD(NLW_ram_reg_704_767_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_704_767_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_704_767_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_704_767_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_704_767_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_704_767_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "704" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_704_767_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_704_767_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_704_767_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_704_767_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_768_831_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_768_831_0_2_n_0),
        .DOB(ram_reg_768_831_0_2_n_1),
        .DOC(ram_reg_768_831_0_2_n_2),
        .DOD(NLW_ram_reg_768_831_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_768_831_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000010001000100)) 
    ram_reg_768_831_0_2_i_1
       (.I0(ram_reg_768_831_0_2_i_2_n_0),
        .I1(ram_reg_768_831_0_2_i_3_n_0),
        .I2(enq_ptr_value_reg[6]),
        .I3(_T_1),
        .I4(maybe_full),
        .I5(ptr_match__3),
        .O(ram_reg_768_831_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ram_reg_768_831_0_2_i_2
       (.I0(enq_ptr_value_reg[10]),
        .I1(enq_ptr_value_reg[7]),
        .O(ram_reg_768_831_0_2_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ram_reg_768_831_0_2_i_3
       (.I0(enq_ptr_value_reg[9]),
        .I1(enq_ptr_value_reg[8]),
        .O(ram_reg_768_831_0_2_i_3_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_768_831_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_768_831_3_5_n_0),
        .DOB(ram_reg_768_831_3_5_n_1),
        .DOC(ram_reg_768_831_3_5_n_2),
        .DOD(NLW_ram_reg_768_831_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_768_831_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_768_831_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_768_831_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_768_831_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_768_831_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "831" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_768_831_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_768_831_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_768_831_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_768_831_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_832_895_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_832_895_0_2_n_0),
        .DOB(ram_reg_832_895_0_2_n_1),
        .DOC(ram_reg_832_895_0_2_n_2),
        .DOD(NLW_ram_reg_832_895_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_832_895_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010101000000000)) 
    ram_reg_832_895_0_2_i_1
       (.I0(ram_reg_768_831_0_2_i_2_n_0),
        .I1(ram_reg_320_383_0_2_i_2_n_0),
        .I2(_T_1),
        .I3(maybe_full),
        .I4(ptr_match__3),
        .I5(enq_ptr_value_reg[9]),
        .O(ram_reg_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_832_895_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_832_895_3_5_n_0),
        .DOB(ram_reg_832_895_3_5_n_1),
        .DOC(ram_reg_832_895_3_5_n_2),
        .DOD(NLW_ram_reg_832_895_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_832_895_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_832_895_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_832_895_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_832_895_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_832_895_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "832" *) 
  (* ram_addr_end = "895" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_832_895_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_832_895_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_832_895_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_832_895_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_896_959_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_896_959_0_2_n_0),
        .DOB(ram_reg_896_959_0_2_n_1),
        .DOC(ram_reg_896_959_0_2_n_2),
        .DOD(NLW_ram_reg_896_959_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_896_959_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010101000000000)) 
    ram_reg_896_959_0_2_i_1
       (.I0(ram_reg_896_959_0_2_i_2_n_0),
        .I1(ram_reg_384_447_0_2_i_2_n_0),
        .I2(_T_1),
        .I3(maybe_full),
        .I4(ptr_match__3),
        .I5(enq_ptr_value_reg[9]),
        .O(ram_reg_896_959_0_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ram_reg_896_959_0_2_i_2
       (.I0(enq_ptr_value_reg[10]),
        .I1(enq_ptr_value_reg[6]),
        .O(ram_reg_896_959_0_2_i_2_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_896_959_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_896_959_3_5_n_0),
        .DOB(ram_reg_896_959_3_5_n_1),
        .DOC(ram_reg_896_959_3_5_n_2),
        .DOD(NLW_ram_reg_896_959_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_896_959_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_896_959_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_896_959_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_896_959_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_896_959_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "896" *) 
  (* ram_addr_end = "959" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_896_959_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_896_959_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_896_959_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_896_959_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_960_1023_0_2
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [0]),
        .DIB(\_T_3_reg[7] [1]),
        .DIC(\_T_3_reg[7] [2]),
        .DID(1'b0),
        .DOA(ram_reg_960_1023_0_2_n_0),
        .DOB(ram_reg_960_1023_0_2_n_1),
        .DOC(ram_reg_960_1023_0_2_n_2),
        .DOD(NLW_ram_reg_960_1023_0_2_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_960_1023_0_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000070)) 
    ram_reg_960_1023_0_2_i_1
       (.I0(ptr_match__3),
        .I1(maybe_full),
        .I2(_T_1),
        .I3(enq_ptr_value_reg[10]),
        .I4(ram_reg_192_255_0_2_i_3_n_0),
        .I5(ram_reg_768_831_0_2_i_3_n_0),
        .O(ram_reg_960_1023_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8200" *) 
  (* RTL_RAM_NAME = "diff_encoder_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM64M" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_960_1023_3_5
       (.ADDRA(deq_ptr_value_reg[5:0]),
        .ADDRB(deq_ptr_value_reg[5:0]),
        .ADDRC(deq_ptr_value_reg[5:0]),
        .ADDRD(enq_ptr_value_reg[5:0]),
        .DIA(\_T_3_reg[7] [3]),
        .DIB(\_T_3_reg[7] [4]),
        .DIC(\_T_3_reg[7] [5]),
        .DID(1'b0),
        .DOA(ram_reg_960_1023_3_5_n_0),
        .DOB(ram_reg_960_1023_3_5_n_1),
        .DOC(ram_reg_960_1023_3_5_n_2),
        .DOD(NLW_ram_reg_960_1023_3_5_DOD_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_960_1023_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_960_1023_6_6
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [6]),
        .DPO(ram_reg_960_1023_6_6_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_960_1023_6_6_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_960_1023_0_2_i_1_n_0));
  (* XILINX_REPORT_XFORM = "RAM64X1D" *) 
  (* ram_addr_begin = "960" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    ram_reg_960_1023_7_7
       (.A0(enq_ptr_value_reg[0]),
        .A1(enq_ptr_value_reg[1]),
        .A2(enq_ptr_value_reg[2]),
        .A3(enq_ptr_value_reg[3]),
        .A4(enq_ptr_value_reg[4]),
        .A5(enq_ptr_value_reg[5]),
        .D(\_T_3_reg[7] [7]),
        .DPO(ram_reg_960_1023_7_7_n_0),
        .DPRA0(deq_ptr_value_reg[0]),
        .DPRA1(deq_ptr_value_reg[1]),
        .DPRA2(deq_ptr_value_reg[2]),
        .DPRA3(deq_ptr_value_reg[3]),
        .DPRA4(deq_ptr_value_reg[4]),
        .DPRA5(deq_ptr_value_reg[5]),
        .SPO(NLW_ram_reg_960_1023_7_7_SPO_UNCONNECTED),
        .WCLK(clock),
        .WE(ram_reg_960_1023_0_2_i_1_n_0));
endmodule

module Queue_1
   (D,
    deq_ptr_value,
    enq_ptr_value,
    maybe_full,
    _T_11_reg,
    correlator_module_io_out_valid,
    clock,
    io_enq_bits,
    reset,
    _T_7,
    _T_11);
  output [7:0]D;
  output deq_ptr_value;
  output enq_ptr_value;
  output maybe_full;
  output _T_11_reg;
  output correlator_module_io_out_valid;
  input clock;
  input [7:0]io_enq_bits;
  input reset;
  input _T_7;
  input _T_11;

  wire [7:0]D;
  wire _T_11;
  wire _T_11_reg;
  wire _T_7;
  wire clock;
  wire correlator_module_io_out_valid;
  wire deq_ptr_value;
  wire deq_ptr_value_i_1_n_0;
  wire enq_ptr_value;
  wire enq_ptr_value_i_1_n_0;
  wire [7:0]io_enq_bits;
  wire maybe_full;
  wire maybe_full_i_1__0_n_0;
  wire ram_reg_0_1_0_5_i_1_n_0;
  wire reset;
  wire [1:0]NLW_ram_reg_0_1_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_ram_reg_0_1_6_7_DOB_UNCONNECTED;
  wire [1:0]NLW_ram_reg_0_1_6_7_DOC_UNCONNECTED;
  wire [1:0]NLW_ram_reg_0_1_6_7_DOD_UNCONNECTED;

  LUT3 #(
    .INIT(8'hBE)) 
    _T_10_i_1
       (.I0(maybe_full),
        .I1(enq_ptr_value),
        .I2(deq_ptr_value),
        .O(correlator_module_io_out_valid));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8FFFFF8F)) 
    _T_8_i_1
       (.I0(_T_11),
        .I1(_T_7),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(_T_11_reg));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4FE0)) 
    deq_ptr_value_i_1
       (.I0(maybe_full),
        .I1(enq_ptr_value),
        .I2(_T_11),
        .I3(deq_ptr_value),
        .O(deq_ptr_value_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    deq_ptr_value_reg
       (.C(clock),
        .CE(1'b1),
        .D(deq_ptr_value_i_1_n_0),
        .Q(deq_ptr_value),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h8FFFB000)) 
    enq_ptr_value_i_1
       (.I0(deq_ptr_value),
        .I1(maybe_full),
        .I2(_T_7),
        .I3(_T_11),
        .I4(enq_ptr_value),
        .O(enq_ptr_value_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    enq_ptr_value_reg
       (.C(clock),
        .CE(1'b1),
        .D(enq_ptr_value_i_1_n_0),
        .Q(enq_ptr_value),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6900F0F0)) 
    maybe_full_i_1__0
       (.I0(enq_ptr_value),
        .I1(deq_ptr_value),
        .I2(maybe_full),
        .I3(_T_7),
        .I4(_T_11),
        .O(maybe_full_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    maybe_full_reg
       (.C(clock),
        .CE(1'b1),
        .D(maybe_full_i_1__0_n_0),
        .Q(maybe_full),
        .R(reset));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16" *) 
  (* RTL_RAM_NAME = "correlator_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM32M" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_0_1_0_5
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,deq_ptr_value}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,deq_ptr_value}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,deq_ptr_value}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,enq_ptr_value}),
        .DIA(io_enq_bits[1:0]),
        .DIB(io_enq_bits[3:2]),
        .DIC(io_enq_bits[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(D[1:0]),
        .DOB(D[3:2]),
        .DOC(D[5:4]),
        .DOD(NLW_ram_reg_0_1_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clock),
        .WE(ram_reg_0_1_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'h08888808)) 
    ram_reg_0_1_0_5_i_1
       (.I0(_T_11),
        .I1(_T_7),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(ram_reg_0_1_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16" *) 
  (* RTL_RAM_NAME = "correlator_module/buffer/ram" *) 
  (* XILINX_REPORT_XFORM = "RAM32M" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ram_reg_0_1_6_7
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,deq_ptr_value}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,deq_ptr_value}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,deq_ptr_value}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,enq_ptr_value}),
        .DIA(io_enq_bits[7:6]),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(D[7:6]),
        .DOB(NLW_ram_reg_0_1_6_7_DOB_UNCONNECTED[1:0]),
        .DOC(NLW_ram_reg_0_1_6_7_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_ram_reg_0_1_6_7_DOD_UNCONNECTED[1:0]),
        .WCLK(clock),
        .WE(ram_reg_0_1_0_5_i_1_n_0));
endmodule

module correlator
   (D,
    _T_11_reg,
    correlator_module_io_out_valid,
    clock,
    reset,
    _T_7,
    _T_11,
    Q);
  output [7:0]D;
  output _T_11_reg;
  output correlator_module_io_out_valid;
  input clock;
  input reset;
  input _T_7;
  input _T_11;
  input [7:0]Q;

  wire [7:0]D;
  wire [7:0]Q;
  wire _T_11;
  wire _T_11_reg;
  wire _T_7;
  wire clock;
  wire correlator_module_io_out_valid;
  wire deq_ptr_value;
  wire enq_ptr_value;
  wire [7:0]io_enq_bits;
  wire maybe_full;
  wire reset;

  Queue_1 buffer
       (.D(D),
        ._T_11(_T_11),
        ._T_11_reg(_T_11_reg),
        ._T_7(_T_7),
        .clock(clock),
        .correlator_module_io_out_valid(correlator_module_io_out_valid),
        .deq_ptr_value(deq_ptr_value),
        .enq_ptr_value(enq_ptr_value),
        .io_enq_bits(io_enq_bits),
        .maybe_full(maybe_full),
        .reset(reset));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_0_5_i_2
       (.I0(D[1]),
        .I1(Q[1]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[1]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_0_5_i_3
       (.I0(D[0]),
        .I1(Q[0]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[0]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_0_5_i_4
       (.I0(D[3]),
        .I1(Q[3]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[3]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_0_5_i_5
       (.I0(D[2]),
        .I1(Q[2]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[2]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_0_5_i_6
       (.I0(D[5]),
        .I1(Q[5]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[5]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_0_5_i_7
       (.I0(D[4]),
        .I1(Q[4]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[4]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_6_7_i_1
       (.I0(D[7]),
        .I1(Q[7]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[7]));
  LUT5 #(
    .INIT(32'h6C66666C)) 
    ram_reg_0_1_6_7_i_2
       (.I0(D[6]),
        .I1(Q[6]),
        .I2(maybe_full),
        .I3(deq_ptr_value),
        .I4(enq_ptr_value),
        .O(io_enq_bits[6]));
endmodule

(* ECO_CHECKSUM = "dace497b" *) 
(* NotValidForBitStream *)
module deaf_encoder
   (clock,
    reset,
    io_in_ready,
    io_in_valid,
    io_in_bits,
    io_out_ready,
    io_out_valid,
    io_out_bits);
  input clock;
  input reset;
  output io_in_ready;
  input io_in_valid;
  input [7:0]io_in_bits;
  input io_out_ready;
  output io_out_valid;
  output [7:0]io_out_bits;

  wire [7:0]_T;
  wire _T_1;
  wire _T_11;
  wire \_T_3_reg_n_0_[0] ;
  wire \_T_3_reg_n_0_[1] ;
  wire \_T_3_reg_n_0_[2] ;
  wire \_T_3_reg_n_0_[3] ;
  wire \_T_3_reg_n_0_[4] ;
  wire \_T_3_reg_n_0_[5] ;
  wire \_T_3_reg_n_0_[6] ;
  wire \_T_3_reg_n_0_[7] ;
  wire _T_4;
  wire _T_5;
  wire [7:0]_T_6;
  wire \_T_6[3]_i_2_n_0 ;
  wire \_T_6[6]_i_2_n_0 ;
  wire _T_7;
  wire _T_8_reg_n_0;
  wire clock;
  wire [7:0]correlator_module_io_out_bits;
  wire correlator_module_io_out_valid;
  wire correlator_module_n_8;
  wire diff_encoder_module_io_in_ready;
  wire [7:0]diff_encoder_module_io_out_bits;
  wire diff_encoder_module_io_out_valid;
  wire [6:0]int_to_sint_module_io_out_bits;
  wire [7:0]io_in_bits;
  wire io_in_ready;
  wire io_in_valid;
  wire [7:0]io_out_bits;
  wire io_out_ready;
  wire io_out_valid;
  wire reset;

  FDRE #(
    .INIT(1'b0)) 
    _T_10_reg
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_valid),
        .Q(io_out_valid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_11_reg
       (.C(clock),
        .CE(1'b1),
        .D(io_out_ready),
        .Q(_T_11),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_1_reg
       (.C(clock),
        .CE(1'b1),
        .D(io_in_valid),
        .Q(_T_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_2_reg
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_in_ready),
        .Q(io_in_ready),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[0]),
        .Q(\_T_3_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[1]),
        .Q(\_T_3_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[2]),
        .Q(\_T_3_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[3] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[3]),
        .Q(\_T_3_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[4] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[4]),
        .Q(\_T_3_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[5] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[5]),
        .Q(\_T_3_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[6] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[6]),
        .Q(\_T_3_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_3_reg[7] 
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_bits[7]),
        .Q(\_T_3_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_4_reg
       (.C(clock),
        .CE(1'b1),
        .D(diff_encoder_module_io_out_valid),
        .Q(_T_4),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_5_reg
       (.C(clock),
        .CE(1'b1),
        .D(_T_8_reg_n_0),
        .Q(_T_5),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAABAAAAA)) 
    \_T_6[0]_i_1 
       (.I0(\_T_3_reg_n_0_[0] ),
        .I1(\_T_3_reg_n_0_[5] ),
        .I2(\_T_6[6]_i_2_n_0 ),
        .I3(\_T_3_reg_n_0_[4] ),
        .I4(\_T_3_reg_n_0_[7] ),
        .I5(\_T_3_reg_n_0_[6] ),
        .O(int_to_sint_module_io_out_bits[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h666A)) 
    \_T_6[1]_i_1 
       (.I0(\_T_3_reg_n_0_[1] ),
        .I1(\_T_3_reg_n_0_[7] ),
        .I2(\_T_3_reg_n_0_[0] ),
        .I3(\_T_6[3]_i_2_n_0 ),
        .O(int_to_sint_module_io_out_bits[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h5556AAAA)) 
    \_T_6[2]_i_1 
       (.I0(\_T_3_reg_n_0_[2] ),
        .I1(\_T_3_reg_n_0_[1] ),
        .I2(\_T_3_reg_n_0_[0] ),
        .I3(\_T_6[3]_i_2_n_0 ),
        .I4(\_T_3_reg_n_0_[7] ),
        .O(int_to_sint_module_io_out_bits[2]));
  LUT6 #(
    .INIT(64'h55555556AAAAAAAA)) 
    \_T_6[3]_i_1 
       (.I0(\_T_3_reg_n_0_[3] ),
        .I1(\_T_3_reg_n_0_[0] ),
        .I2(\_T_3_reg_n_0_[1] ),
        .I3(\_T_3_reg_n_0_[2] ),
        .I4(\_T_6[3]_i_2_n_0 ),
        .I5(\_T_3_reg_n_0_[7] ),
        .O(int_to_sint_module_io_out_bits[3]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \_T_6[3]_i_2 
       (.I0(\_T_6[6]_i_2_n_0 ),
        .I1(\_T_3_reg_n_0_[4] ),
        .I2(\_T_3_reg_n_0_[6] ),
        .I3(\_T_3_reg_n_0_[5] ),
        .O(\_T_6[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hFF0F10F0)) 
    \_T_6[4]_i_1 
       (.I0(\_T_3_reg_n_0_[5] ),
        .I1(\_T_3_reg_n_0_[6] ),
        .I2(\_T_3_reg_n_0_[7] ),
        .I3(\_T_6[6]_i_2_n_0 ),
        .I4(\_T_3_reg_n_0_[4] ),
        .O(int_to_sint_module_io_out_bits[4]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h30FFDF00)) 
    \_T_6[5]_i_1 
       (.I0(\_T_3_reg_n_0_[6] ),
        .I1(\_T_3_reg_n_0_[4] ),
        .I2(\_T_6[6]_i_2_n_0 ),
        .I3(\_T_3_reg_n_0_[7] ),
        .I4(\_T_3_reg_n_0_[5] ),
        .O(int_to_sint_module_io_out_bits[5]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h04FFFF00)) 
    \_T_6[6]_i_1 
       (.I0(\_T_3_reg_n_0_[4] ),
        .I1(\_T_6[6]_i_2_n_0 ),
        .I2(\_T_3_reg_n_0_[5] ),
        .I3(\_T_3_reg_n_0_[6] ),
        .I4(\_T_3_reg_n_0_[7] ),
        .O(int_to_sint_module_io_out_bits[6]));
  LUT4 #(
    .INIT(16'h0001)) 
    \_T_6[6]_i_2 
       (.I0(\_T_3_reg_n_0_[3] ),
        .I1(\_T_3_reg_n_0_[2] ),
        .I2(\_T_3_reg_n_0_[1] ),
        .I3(\_T_3_reg_n_0_[0] ),
        .O(\_T_6[6]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[0]),
        .Q(_T_6[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[1]),
        .Q(_T_6[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[2]),
        .Q(_T_6[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[3] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[3]),
        .Q(_T_6[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[4] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[4]),
        .Q(_T_6[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[5] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[5]),
        .Q(_T_6[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[6] 
       (.C(clock),
        .CE(1'b1),
        .D(int_to_sint_module_io_out_bits[6]),
        .Q(_T_6[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_6_reg[7] 
       (.C(clock),
        .CE(1'b1),
        .D(\_T_3_reg_n_0_[7] ),
        .Q(_T_6[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_7_reg
       (.C(clock),
        .CE(1'b1),
        .D(_T_4),
        .Q(_T_7),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    _T_8_reg
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_n_8),
        .Q(_T_8_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[0]),
        .Q(io_out_bits[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[1]),
        .Q(io_out_bits[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[2]),
        .Q(io_out_bits[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[3] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[3]),
        .Q(io_out_bits[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[4] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[4]),
        .Q(io_out_bits[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[5] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[5]),
        .Q(io_out_bits[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[6] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[6]),
        .Q(io_out_bits[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_9_reg[7] 
       (.C(clock),
        .CE(1'b1),
        .D(correlator_module_io_out_bits[7]),
        .Q(io_out_bits[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[0]),
        .Q(_T[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[1]),
        .Q(_T[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[2]),
        .Q(_T[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[3] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[3]),
        .Q(_T[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[4] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[4]),
        .Q(_T[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[5] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[5]),
        .Q(_T[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[6] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[6]),
        .Q(_T[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \_T_reg[7] 
       (.C(clock),
        .CE(1'b1),
        .D(io_in_bits[7]),
        .Q(_T[7]),
        .R(1'b0));
  correlator correlator_module
       (.D(correlator_module_io_out_bits),
        .Q(_T_6),
        ._T_11(_T_11),
        ._T_11_reg(correlator_module_n_8),
        ._T_7(_T_7),
        .clock(clock),
        .correlator_module_io_out_valid(correlator_module_io_out_valid),
        .reset(reset));
  diff_encoder diff_encoder_module
       (.O2(diff_encoder_module_io_out_bits),
        .Q(_T),
        ._T_1(_T_1),
        .clock(clock),
        .\deq_ptr_value_reg[0] (_T_5),
        .diff_encoder_module_io_in_ready(diff_encoder_module_io_in_ready),
        .diff_encoder_module_io_out_valid(diff_encoder_module_io_out_valid),
        .reset(reset));
endmodule

module diff_encoder
   (diff_encoder_module_io_out_valid,
    diff_encoder_module_io_in_ready,
    O2,
    clock,
    reset,
    \deq_ptr_value_reg[0] ,
    _T_1,
    Q);
  output diff_encoder_module_io_out_valid;
  output diff_encoder_module_io_in_ready;
  output [7:0]O2;
  input clock;
  input reset;
  input \deq_ptr_value_reg[0] ;
  input _T_1;
  input [7:0]Q;

  wire [7:0]O2;
  wire [7:0]Q;
  wire _T_1;
  wire [10:0]_T_3;
  wire _T_5_carry_n_0;
  wire buffer_n_0;
  wire buffer_n_1;
  wire buffer_n_2;
  wire buffer_n_3;
  wire buffer_n_6;
  wire buffer_n_7;
  wire buffer_n_8;
  wire buffer_n_9;
  wire clock;
  wire \counter[10]_i_3_n_0 ;
  wire [10:10]counter_reg;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire \deq_ptr_value_reg[0] ;
  wire diff_encoder_module_io_in_ready;
  wire diff_encoder_module_io_out_valid;
  wire p_1_out;
  wire reset;
  wire [2:0]NLW__T_5_carry_CO_UNCONNECTED;
  wire [3:0]NLW__T_5_carry__0_CO_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 _T_5_carry
       (.CI(1'b0),
        .CO({_T_5_carry_n_0,NLW__T_5_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(counter_reg),
        .DI(Q[3:0]),
        .O(O2[3:0]),
        .S({buffer_n_6,buffer_n_7,buffer_n_8,buffer_n_9}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 _T_5_carry__0
       (.CI(_T_5_carry_n_0),
        .CO(NLW__T_5_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(O2[7:4]),
        .S({buffer_n_0,buffer_n_1,buffer_n_2,buffer_n_3}));
  Queue buffer
       (.Q(counter_reg),
        .S({buffer_n_0,buffer_n_1,buffer_n_2,buffer_n_3}),
        ._T_1(_T_1),
        .\_T_3_reg[7] (Q),
        .\_T_reg[3] ({buffer_n_6,buffer_n_7,buffer_n_8,buffer_n_9}),
        .clock(clock),
        .\deq_ptr_value_reg[0]_0 (\deq_ptr_value_reg[0] ),
        .diff_encoder_module_io_in_ready(diff_encoder_module_io_in_ready),
        .diff_encoder_module_io_out_valid(diff_encoder_module_io_out_valid),
        .reset(reset));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .O(_T_3[0]));
  LUT3 #(
    .INIT(8'h08)) 
    \counter[10]_i_1 
       (.I0(_T_1),
        .I1(\deq_ptr_value_reg[0] ),
        .I2(counter_reg),
        .O(p_1_out));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    \counter[10]_i_2 
       (.I0(\counter_reg_n_0_[9] ),
        .I1(\counter_reg_n_0_[7] ),
        .I2(\counter[10]_i_3_n_0 ),
        .I3(\counter_reg_n_0_[6] ),
        .I4(\counter_reg_n_0_[8] ),
        .O(_T_3[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \counter[10]_i_3 
       (.I0(\counter_reg_n_0_[4] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[3] ),
        .I5(\counter_reg_n_0_[5] ),
        .O(\counter[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .O(_T_3[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter[2]_i_1 
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[2] ),
        .O(_T_3[2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter[3]_i_1 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[3] ),
        .O(_T_3[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter[4]_i_1 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[4] ),
        .O(_T_3[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter[5]_i_1 
       (.I0(\counter_reg_n_0_[4] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[3] ),
        .I5(\counter_reg_n_0_[5] ),
        .O(_T_3[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \counter[6]_i_1 
       (.I0(\counter[10]_i_3_n_0 ),
        .I1(\counter_reg_n_0_[6] ),
        .O(_T_3[6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \counter[7]_i_1 
       (.I0(\counter_reg_n_0_[6] ),
        .I1(\counter[10]_i_3_n_0 ),
        .I2(\counter_reg_n_0_[7] ),
        .O(_T_3[7]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hDF20)) 
    \counter[8]_i_1 
       (.I0(\counter_reg_n_0_[7] ),
        .I1(\counter[10]_i_3_n_0 ),
        .I2(\counter_reg_n_0_[6] ),
        .I3(\counter_reg_n_0_[8] ),
        .O(_T_3[8]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hF7FF0800)) 
    \counter[9]_i_1 
       (.I0(\counter_reg_n_0_[8] ),
        .I1(\counter_reg_n_0_[6] ),
        .I2(\counter[10]_i_3_n_0 ),
        .I3(\counter_reg_n_0_[7] ),
        .I4(\counter_reg_n_0_[9] ),
        .O(_T_3[9]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[0]),
        .Q(\counter_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[10]),
        .Q(counter_reg),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[1]),
        .Q(\counter_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[2]),
        .Q(\counter_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[3]),
        .Q(\counter_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[4]),
        .Q(\counter_reg_n_0_[4] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[5]),
        .Q(\counter_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[6]),
        .Q(\counter_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[7]),
        .Q(\counter_reg_n_0_[7] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[8]),
        .Q(\counter_reg_n_0_[8] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clock),
        .CE(p_1_out),
        .D(_T_3[9]),
        .Q(\counter_reg_n_0_[9] ),
        .R(reset));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
