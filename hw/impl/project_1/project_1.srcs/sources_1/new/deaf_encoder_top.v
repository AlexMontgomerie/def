`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2020 11:45:58
// Design Name: 
// Module Name: deaf_encoder_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module deaf_encoder_top(
  input        clock,
  input        reset,
  output       in_ready,
  input        in_valid,
  input  [7:0] in_bits,
  input        out_ready,
  output       out_valid,
  output [7:0] out_bits
);

    deaf_encoder deaf_encoder_module(
        .clock(clock),
        .reset(reset),
        .io_in_ready(in_ready),
        .io_in_valid(in_valid),
        .io_in_bits(in_bits),
        .io_out_ready(out_ready),
        .io_out_valid(out_valid),
        .io_out_bits(out_bits)
  );
  
endmodule
