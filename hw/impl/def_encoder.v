module Queue(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [9:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [9:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] ram [0:10]; // @[Decoupled.scala 218:16]
  wire [9:0] ram__T_11_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram__T_11_addr; // @[Decoupled.scala 218:16]
  wire [9:0] ram__T_3_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram__T_3_addr; // @[Decoupled.scala 218:16]
  wire  ram__T_3_mask; // @[Decoupled.scala 218:16]
  wire  ram__T_3_en; // @[Decoupled.scala 218:16]
  reg [3:0] enq_ptr_value; // @[Counter.scala 29:33]
  reg [3:0] deq_ptr_value; // @[Counter.scala 29:33]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 223:33]
  wire  _T = ~maybe_full; // @[Decoupled.scala 224:28]
  wire  empty = ptr_match & _T; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = enq_ptr_value == 4'ha; // @[Counter.scala 38:24]
  wire [3:0] _T_5 = enq_ptr_value + 4'h1; // @[Counter.scala 39:22]
  wire  wrap_1 = deq_ptr_value == 4'ha; // @[Counter.scala 38:24]
  wire [3:0] _T_7 = deq_ptr_value + 4'h1; // @[Counter.scala 39:22]
  wire  _T_8 = do_enq != do_deq; // @[Decoupled.scala 236:16]
  assign ram__T_11_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram__T_11_data = ram[ram__T_11_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram__T_11_data = ram__T_11_addr >= 4'hb ? _RAND_1[9:0] : ram[ram__T_11_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram__T_3_data = io_enq_bits;
  assign ram__T_3_addr = enq_ptr_value;
  assign ram__T_3_mask = 1'h1;
  assign ram__T_3_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:16]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:16]
  assign io_deq_bits = ram__T_11_data; // @[Decoupled.scala 242:15]
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
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 11; initvar = initvar+1)
    ram[initvar] = _RAND_0[9:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(ram__T_3_en & ram__T_3_mask) begin
      ram[ram__T_3_addr] <= ram__T_3_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin
      enq_ptr_value <= 4'h0;
    end else if (do_enq) begin
      if (wrap) begin
        enq_ptr_value <= 4'h0;
      end else begin
        enq_ptr_value <= _T_5;
      end
    end
    if (reset) begin
      deq_ptr_value <= 4'h0;
    end else if (do_deq) begin
      if (wrap_1) begin
        deq_ptr_value <= 4'h0;
      end else begin
        deq_ptr_value <= _T_7;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (_T_8) begin
      maybe_full <= do_enq;
    end
  end
endmodule
module diff_encoder(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [9:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  buffer_clock; // @[DEF.scala 70:22]
  wire  buffer_reset; // @[DEF.scala 70:22]
  wire  buffer_io_enq_ready; // @[DEF.scala 70:22]
  wire  buffer_io_enq_valid; // @[DEF.scala 70:22]
  wire [9:0] buffer_io_enq_bits; // @[DEF.scala 70:22]
  wire  buffer_io_deq_ready; // @[DEF.scala 70:22]
  wire  buffer_io_deq_valid; // @[DEF.scala 70:22]
  wire [9:0] buffer_io_deq_bits; // @[DEF.scala 70:22]
  reg [31:0] counter; // @[DEF.scala 73:24]
  wire  _T = io_in_valid & io_out_ready; // @[DEF.scala 82:21]
  wire  _T_1 = counter < 32'ha; // @[DEF.scala 84:19]
  wire [31:0] _T_3 = counter + 32'h1; // @[DEF.scala 86:26]
  wire [9:0] _T_5 = io_in_bits - buffer_io_deq_bits; // @[DEF.scala 88:31]
  wire  _GEN_0 = buffer_io_deq_valid | buffer_io_enq_ready; // @[DEF.scala 87:39]
  wire  _GEN_1 = buffer_io_deq_valid; // @[DEF.scala 87:39]
  wire  _GEN_3 = _T_1 | _GEN_0; // @[DEF.scala 84:31]
  wire  _GEN_4 = _T_1 | _GEN_1; // @[DEF.scala 84:31]
  wire  _GEN_7 = _T_1 ? 1'h0 : _GEN_1; // @[DEF.scala 84:31]
  wire  _GEN_8 = _T ? _GEN_3 : buffer_io_enq_ready; // @[DEF.scala 82:39]
  Queue buffer ( // @[DEF.scala 70:22]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_enq_ready(buffer_io_enq_ready),
    .io_enq_valid(buffer_io_enq_valid),
    .io_enq_bits(buffer_io_enq_bits),
    .io_deq_ready(buffer_io_deq_ready),
    .io_deq_valid(buffer_io_deq_valid),
    .io_deq_bits(buffer_io_deq_bits)
  );
  assign io_in_ready = io_in_valid | _GEN_8; // @[DEF.scala 79:15 Decoupled.scala 65:20 Decoupled.scala 65:20 Decoupled.scala 65:20]
  assign io_out_valid = _T & _GEN_4; // @[Decoupled.scala 47:20 Decoupled.scala 47:20 Decoupled.scala 56:20 Decoupled.scala 56:20]
  assign io_out_bits = _T_1 ? io_in_bits : _T_5; // @[Decoupled.scala 48:19 Decoupled.scala 48:19]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_valid = io_in_valid; // @[Decoupled.scala 47:20 Decoupled.scala 56:20]
  assign buffer_io_enq_bits = io_in_bits; // @[Decoupled.scala 48:19]
  assign buffer_io_deq_ready = _T & _GEN_7; // @[Decoupled.scala 72:20 Decoupled.scala 65:20]
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
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
  counter = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      counter <= 32'h0;
    end else if (_T) begin
      if (_T_1) begin
        counter <= _T_3;
      end
    end
  end
endmodule
module int_to_sint(
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [9:0] io_out_bits
);
  wire  _T_3 = io_in_bits[8:0] == 9'h0; // @[DEF.scala 20:33]
  wire [8:0] _T_5 = ~io_in_bits[8:0]; // @[DEF.scala 21:37]
  wire [9:0] _T_6 = {1'h1,_T_5}; // @[Cat.scala 29:58]
  wire [8:0] _T_10 = _T_5 + 9'h1; // @[DEF.scala 23:60]
  wire [9:0] _T_11 = {1'h1,_T_10}; // @[Cat.scala 29:58]
  wire [9:0] _GEN_0 = _T_3 ? _T_6 : _T_11; // @[DEF.scala 20:43]
  assign io_in_ready = io_out_ready; // @[DEF.scala 31:17]
  assign io_out_valid = io_in_valid; // @[DEF.scala 30:17]
  assign io_out_bits = io_in_bits[9] ? _GEN_0 : io_in_bits; // @[DEF.scala 21:19 DEF.scala 23:19 DEF.scala 26:17]
endmodule
module Queue_1(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [9:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [9:0] io_deq_bits,
  output [1:0] io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] ram [0:1]; // @[Decoupled.scala 218:16]
  wire [9:0] ram__T_11_data; // @[Decoupled.scala 218:16]
  wire  ram__T_11_addr; // @[Decoupled.scala 218:16]
  wire [9:0] ram__T_3_data; // @[Decoupled.scala 218:16]
  wire  ram__T_3_addr; // @[Decoupled.scala 218:16]
  wire  ram__T_3_mask; // @[Decoupled.scala 218:16]
  wire  ram__T_3_en; // @[Decoupled.scala 218:16]
  reg  enq_ptr_value; // @[Counter.scala 29:33]
  reg  deq_ptr_value; // @[Counter.scala 29:33]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 223:33]
  wire  _T = ~maybe_full; // @[Decoupled.scala 224:28]
  wire  empty = ptr_match & _T; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  _T_5 = enq_ptr_value + 1'h1; // @[Counter.scala 39:22]
  wire  _T_7 = deq_ptr_value + 1'h1; // @[Counter.scala 39:22]
  wire  _T_8 = do_enq != do_deq; // @[Decoupled.scala 236:16]
  wire  ptr_diff = enq_ptr_value - deq_ptr_value; // @[Decoupled.scala 257:32]
  wire  _T_13 = maybe_full & ptr_match; // @[Decoupled.scala 259:32]
  wire [1:0] _T_14 = _T_13 ? 2'h2 : 2'h0; // @[Decoupled.scala 259:20]
  wire [1:0] _GEN_8 = {{1'd0}, ptr_diff}; // @[Decoupled.scala 259:62]
  assign ram__T_11_addr = deq_ptr_value;
  assign ram__T_11_data = ram[ram__T_11_addr]; // @[Decoupled.scala 218:16]
  assign ram__T_3_data = io_enq_bits;
  assign ram__T_3_addr = enq_ptr_value;
  assign ram__T_3_mask = 1'h1;
  assign ram__T_3_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:16]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:16]
  assign io_deq_bits = ram__T_11_data; // @[Decoupled.scala 242:15]
  assign io_count = _T_14 | _GEN_8; // @[Decoupled.scala 259:14]
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
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = _RAND_0[9:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(ram__T_3_en & ram__T_3_mask) begin
      ram[ram__T_3_addr] <= ram__T_3_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin
      enq_ptr_value <= 1'h0;
    end else if (do_enq) begin
      enq_ptr_value <= _T_5;
    end
    if (reset) begin
      deq_ptr_value <= 1'h0;
    end else if (do_deq) begin
      deq_ptr_value <= _T_7;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (_T_8) begin
      maybe_full <= do_enq;
    end
  end
endmodule
module correlator(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [9:0] io_out_bits
);
  wire  buffer_clock; // @[DEF.scala 155:22]
  wire  buffer_reset; // @[DEF.scala 155:22]
  wire  buffer_io_enq_ready; // @[DEF.scala 155:22]
  wire  buffer_io_enq_valid; // @[DEF.scala 155:22]
  wire [9:0] buffer_io_enq_bits; // @[DEF.scala 155:22]
  wire  buffer_io_deq_ready; // @[DEF.scala 155:22]
  wire  buffer_io_deq_valid; // @[DEF.scala 155:22]
  wire [9:0] buffer_io_deq_bits; // @[DEF.scala 155:22]
  wire [1:0] buffer_io_count; // @[DEF.scala 155:22]
  wire  _T = io_in_valid & io_out_ready; // @[DEF.scala 164:21]
  wire  _T_1 = buffer_io_count == 2'h0; // @[DEF.scala 165:27]
  wire [9:0] _T_2 = io_in_bits ^ buffer_io_deq_bits; // @[DEF.scala 168:38]
  wire  _GEN_2 = _T_1 ? io_out_ready : 1'h1; // @[DEF.scala 165:37]
  Queue_1 buffer ( // @[DEF.scala 155:22]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_enq_ready(buffer_io_enq_ready),
    .io_enq_valid(buffer_io_enq_valid),
    .io_enq_bits(buffer_io_enq_bits),
    .io_deq_ready(buffer_io_deq_ready),
    .io_deq_valid(buffer_io_deq_valid),
    .io_deq_bits(buffer_io_deq_bits),
    .io_count(buffer_io_count)
  );
  assign io_in_ready = _T | buffer_io_enq_ready; // @[DEF.scala 158:15 Decoupled.scala 65:20 Decoupled.scala 65:20]
  assign io_out_valid = buffer_io_deq_valid; // @[DEF.scala 161:10]
  assign io_out_bits = buffer_io_deq_bits; // @[DEF.scala 161:10]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_valid = io_in_valid & io_out_ready; // @[Decoupled.scala 47:20 Decoupled.scala 47:20 Decoupled.scala 56:20]
  assign buffer_io_enq_bits = _T_1 ? io_in_bits : _T_2; // @[Decoupled.scala 48:19 Decoupled.scala 48:19]
  assign buffer_io_deq_ready = _T ? _GEN_2 : io_out_ready; // @[DEF.scala 161:10 Decoupled.scala 65:20]
endmodule
module def_encoder(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [9:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  diff_encoder_module_clock; // @[DEF.scala 214:35]
  wire  diff_encoder_module_reset; // @[DEF.scala 214:35]
  wire  diff_encoder_module_io_in_ready; // @[DEF.scala 214:35]
  wire  diff_encoder_module_io_in_valid; // @[DEF.scala 214:35]
  wire [9:0] diff_encoder_module_io_in_bits; // @[DEF.scala 214:35]
  wire  diff_encoder_module_io_out_ready; // @[DEF.scala 214:35]
  wire  diff_encoder_module_io_out_valid; // @[DEF.scala 214:35]
  wire [9:0] diff_encoder_module_io_out_bits; // @[DEF.scala 214:35]
  wire  int_to_sint_module_io_in_ready; // @[DEF.scala 215:35]
  wire  int_to_sint_module_io_in_valid; // @[DEF.scala 215:35]
  wire [9:0] int_to_sint_module_io_in_bits; // @[DEF.scala 215:35]
  wire  int_to_sint_module_io_out_ready; // @[DEF.scala 215:35]
  wire  int_to_sint_module_io_out_valid; // @[DEF.scala 215:35]
  wire [9:0] int_to_sint_module_io_out_bits; // @[DEF.scala 215:35]
  wire  correlator_module_clock; // @[DEF.scala 216:35]
  wire  correlator_module_reset; // @[DEF.scala 216:35]
  wire  correlator_module_io_in_ready; // @[DEF.scala 216:35]
  wire  correlator_module_io_in_valid; // @[DEF.scala 216:35]
  wire [9:0] correlator_module_io_in_bits; // @[DEF.scala 216:35]
  wire  correlator_module_io_out_ready; // @[DEF.scala 216:35]
  wire  correlator_module_io_out_valid; // @[DEF.scala 216:35]
  wire [9:0] correlator_module_io_out_bits; // @[DEF.scala 216:35]
  reg [9:0] _T; // @[DEF.scala 219:45]
  reg  _T_1; // @[DEF.scala 220:45]
  reg  _T_2; // @[DEF.scala 221:25]
  reg [9:0] _T_3; // @[DEF.scala 224:47]
  reg  _T_4; // @[DEF.scala 225:47]
  reg  _T_5; // @[DEF.scala 226:47]
  reg [9:0] _T_6; // @[DEF.scala 229:45]
  reg  _T_7; // @[DEF.scala 230:45]
  reg  _T_8; // @[DEF.scala 231:45]
  reg [9:0] _T_9; // @[DEF.scala 234:27]
  reg  _T_10; // @[DEF.scala 235:27]
  reg  _T_11; // @[DEF.scala 236:44]
  diff_encoder diff_encoder_module ( // @[DEF.scala 214:35]
    .clock(diff_encoder_module_clock),
    .reset(diff_encoder_module_reset),
    .io_in_ready(diff_encoder_module_io_in_ready),
    .io_in_valid(diff_encoder_module_io_in_valid),
    .io_in_bits(diff_encoder_module_io_in_bits),
    .io_out_ready(diff_encoder_module_io_out_ready),
    .io_out_valid(diff_encoder_module_io_out_valid),
    .io_out_bits(diff_encoder_module_io_out_bits)
  );
  int_to_sint int_to_sint_module ( // @[DEF.scala 215:35]
    .io_in_ready(int_to_sint_module_io_in_ready),
    .io_in_valid(int_to_sint_module_io_in_valid),
    .io_in_bits(int_to_sint_module_io_in_bits),
    .io_out_ready(int_to_sint_module_io_out_ready),
    .io_out_valid(int_to_sint_module_io_out_valid),
    .io_out_bits(int_to_sint_module_io_out_bits)
  );
  correlator correlator_module ( // @[DEF.scala 216:35]
    .clock(correlator_module_clock),
    .reset(correlator_module_reset),
    .io_in_ready(correlator_module_io_in_ready),
    .io_in_valid(correlator_module_io_in_valid),
    .io_in_bits(correlator_module_io_in_bits),
    .io_out_ready(correlator_module_io_out_ready),
    .io_out_valid(correlator_module_io_out_valid),
    .io_out_bits(correlator_module_io_out_bits)
  );
  assign io_in_ready = _T_2; // @[DEF.scala 221:15]
  assign io_out_valid = _T_10; // @[DEF.scala 235:17]
  assign io_out_bits = _T_9; // @[DEF.scala 234:17]
  assign diff_encoder_module_clock = clock;
  assign diff_encoder_module_reset = reset;
  assign diff_encoder_module_io_in_valid = _T_1; // @[DEF.scala 220:35]
  assign diff_encoder_module_io_in_bits = _T; // @[DEF.scala 219:35]
  assign diff_encoder_module_io_out_ready = _T_5; // @[DEF.scala 226:37]
  assign int_to_sint_module_io_in_valid = _T_4; // @[DEF.scala 225:37]
  assign int_to_sint_module_io_in_bits = _T_3; // @[DEF.scala 224:37]
  assign int_to_sint_module_io_out_ready = _T_8; // @[DEF.scala 231:35]
  assign correlator_module_clock = clock;
  assign correlator_module_reset = reset;
  assign correlator_module_io_in_valid = _T_7; // @[DEF.scala 230:35]
  assign correlator_module_io_in_bits = _T_6; // @[DEF.scala 229:35]
  assign correlator_module_io_out_ready = _T_11; // @[DEF.scala 236:34]
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
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
  _T = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_3 = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_6 = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  _T_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_9 = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  _T_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_11 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    _T <= io_in_bits;
    _T_1 <= io_in_valid;
    _T_2 <= diff_encoder_module_io_in_ready;
    _T_3 <= diff_encoder_module_io_out_bits;
    _T_4 <= diff_encoder_module_io_out_valid;
    _T_5 <= int_to_sint_module_io_in_ready;
    _T_6 <= int_to_sint_module_io_out_bits;
    _T_7 <= int_to_sint_module_io_out_valid;
    _T_8 <= correlator_module_io_in_ready;
    _T_9 <= correlator_module_io_out_bits;
    _T_10 <= correlator_module_io_out_valid;
    _T_11 <= io_out_ready;
  end
endmodule
