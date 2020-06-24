module int_to_sint(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  output [7:0] io_out
);
  reg [7:0] reg_; // @[DEAF.scala 15:16]
  reg [31:0] _RAND_0;
  wire  _T_3; // @[DEAF.scala 18:28]
  wire [6:0] _T_5; // @[DEAF.scala 19:29]
  wire [7:0] _T_6; // @[Cat.scala 29:58]
  wire [6:0] _T_10; // @[DEAF.scala 21:47]
  wire [7:0] _T_11; // @[Cat.scala 29:58]
  assign _T_3 = io_in[6:0] == 7'h0; // @[DEAF.scala 18:28]
  assign _T_5 = ~io_in[6:0]; // @[DEAF.scala 19:29]
  assign _T_6 = {1'h1,_T_5}; // @[Cat.scala 29:58]
  assign _T_10 = _T_5 + 7'h1; // @[DEAF.scala 21:47]
  assign _T_11 = {1'h1,_T_10}; // @[Cat.scala 29:58]
  assign io_out = reg_; // @[DEAF.scala 28:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_in[7]) begin
      if (_T_3) begin
        reg_ <= _T_6;
      end else begin
        reg_ <= _T_11;
      end
    end else begin
      reg_ <= io_in;
    end
  end
endmodule
