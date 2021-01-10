module Queue(
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
module decorrelator(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [9:0] io_out_bits
);
  wire  buffer_clock; // @[DEF.scala 183:22]
  wire  buffer_reset; // @[DEF.scala 183:22]
  wire  buffer_io_enq_ready; // @[DEF.scala 183:22]
  wire  buffer_io_enq_valid; // @[DEF.scala 183:22]
  wire [9:0] buffer_io_enq_bits; // @[DEF.scala 183:22]
  wire  buffer_io_deq_ready; // @[DEF.scala 183:22]
  wire  buffer_io_deq_valid; // @[DEF.scala 183:22]
  wire [9:0] buffer_io_deq_bits; // @[DEF.scala 183:22]
  wire [1:0] buffer_io_count; // @[DEF.scala 183:22]
  wire  _T = io_in_valid & io_out_ready; // @[DEF.scala 192:21]
  wire  _T_1 = buffer_io_count == 2'h0; // @[DEF.scala 194:27]
  wire [9:0] _T_2 = io_in_bits ^ buffer_io_deq_bits; // @[DEF.scala 197:31]
  wire  _GEN_2 = _T_1 ? io_out_ready : 1'h1; // @[DEF.scala 194:37]
  Queue buffer ( // @[DEF.scala 183:22]
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
  assign io_in_ready = _T | buffer_io_enq_ready; // @[DEF.scala 189:15 Decoupled.scala 65:20 Decoupled.scala 65:20 Decoupled.scala 65:20]
  assign io_out_valid = io_in_valid & io_out_ready; // @[Decoupled.scala 47:20 Decoupled.scala 47:20 Decoupled.scala 56:20]
  assign io_out_bits = _T_1 ? io_in_bits : _T_2; // @[Decoupled.scala 48:19 Decoupled.scala 48:19]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_valid = io_in_valid & io_out_ready; // @[Decoupled.scala 47:20 Decoupled.scala 56:20]
  assign buffer_io_enq_bits = io_in_bits; // @[Decoupled.scala 48:19]
  assign buffer_io_deq_ready = _T ? _GEN_2 : io_out_ready; // @[DEF.scala 186:23 Decoupled.scala 65:20]
endmodule
module sint_to_int(
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [9:0] io_out_bits
);
  wire  _T_3 = io_in_bits[8:0] == 9'h1ff; // @[DEF.scala 45:33]
  wire [8:0] _T_5 = ~io_in_bits[8:0]; // @[DEF.scala 46:37]
  wire [9:0] _T_6 = {1'h1,_T_5}; // @[Cat.scala 29:58]
  wire [8:0] _T_10 = _T_5 + 9'h1; // @[DEF.scala 48:60]
  wire [9:0] _T_11 = {1'h1,_T_10}; // @[Cat.scala 29:58]
  wire [9:0] _GEN_0 = _T_3 ? _T_6 : _T_11; // @[DEF.scala 45:60]
  assign io_in_ready = io_out_ready; // @[DEF.scala 56:17]
  assign io_out_valid = io_in_valid; // @[DEF.scala 55:17]
  assign io_out_bits = io_in_bits[9] ? _GEN_0 : io_in_bits; // @[DEF.scala 46:19 DEF.scala 48:19 DEF.scala 51:17]
endmodule
module Queue_1(
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
module diff_decoder(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [9:0] io_in_bits,
  output       io_out_valid,
  output [9:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  buffer_clock; // @[DEF.scala 115:22]
  wire  buffer_reset; // @[DEF.scala 115:22]
  wire  buffer_io_enq_ready; // @[DEF.scala 115:22]
  wire  buffer_io_enq_valid; // @[DEF.scala 115:22]
  wire [9:0] buffer_io_enq_bits; // @[DEF.scala 115:22]
  wire  buffer_io_deq_ready; // @[DEF.scala 115:22]
  wire  buffer_io_deq_valid; // @[DEF.scala 115:22]
  wire [9:0] buffer_io_deq_bits; // @[DEF.scala 115:22]
  reg [31:0] counter; // @[DEF.scala 118:24]
  wire  _T = counter < 32'ha; // @[DEF.scala 129:19]
  wire [31:0] _T_2 = counter + 32'h1; // @[DEF.scala 132:26]
  wire [9:0] _T_4 = io_in_bits + buffer_io_deq_bits; // @[DEF.scala 134:31]
  wire  _GEN_4 = _T ? 1'h0 : 1'h1; // @[DEF.scala 129:31]
  Queue_1 buffer ( // @[DEF.scala 115:22]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_enq_ready(buffer_io_enq_ready),
    .io_enq_valid(buffer_io_enq_valid),
    .io_enq_bits(buffer_io_enq_bits),
    .io_deq_ready(buffer_io_deq_ready),
    .io_deq_valid(buffer_io_deq_valid),
    .io_deq_bits(buffer_io_deq_bits)
  );
  assign io_in_ready = io_in_valid | buffer_io_enq_ready; // @[DEF.scala 121:15 Decoupled.scala 65:20 Decoupled.scala 65:20 Decoupled.scala 65:20 Decoupled.scala 65:20]
  assign io_out_valid = io_in_valid; // @[Decoupled.scala 47:20 Decoupled.scala 47:20 Decoupled.scala 56:20]
  assign io_out_bits = _T ? io_in_bits : _T_4; // @[Decoupled.scala 48:19 Decoupled.scala 48:19]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_valid = io_in_valid; // @[Decoupled.scala 47:20 Decoupled.scala 47:20 Decoupled.scala 56:20]
  assign buffer_io_enq_bits = _T ? io_in_bits : _T_4; // @[Decoupled.scala 48:19 Decoupled.scala 48:19]
  assign buffer_io_deq_ready = io_in_valid & _GEN_4; // @[Decoupled.scala 72:20 Decoupled.scala 65:20 Decoupled.scala 65:20]
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
    end else if (io_in_valid) begin
      if (_T) begin
        counter <= _T_2;
      end
    end
  end
endmodule
module def_decoder(
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
`endif // RANDOMIZE_REG_INIT
  wire  decorrelator_module_clock; // @[DEF.scala 248:35]
  wire  decorrelator_module_reset; // @[DEF.scala 248:35]
  wire  decorrelator_module_io_in_ready; // @[DEF.scala 248:35]
  wire  decorrelator_module_io_in_valid; // @[DEF.scala 248:35]
  wire [9:0] decorrelator_module_io_in_bits; // @[DEF.scala 248:35]
  wire  decorrelator_module_io_out_ready; // @[DEF.scala 248:35]
  wire  decorrelator_module_io_out_valid; // @[DEF.scala 248:35]
  wire [9:0] decorrelator_module_io_out_bits; // @[DEF.scala 248:35]
  wire  sint_to_int_module_io_in_ready; // @[DEF.scala 249:35]
  wire  sint_to_int_module_io_in_valid; // @[DEF.scala 249:35]
  wire [9:0] sint_to_int_module_io_in_bits; // @[DEF.scala 249:35]
  wire  sint_to_int_module_io_out_ready; // @[DEF.scala 249:35]
  wire  sint_to_int_module_io_out_valid; // @[DEF.scala 249:35]
  wire [9:0] sint_to_int_module_io_out_bits; // @[DEF.scala 249:35]
  wire  diff_decoder_module_clock; // @[DEF.scala 250:35]
  wire  diff_decoder_module_reset; // @[DEF.scala 250:35]
  wire  diff_decoder_module_io_in_ready; // @[DEF.scala 250:35]
  wire  diff_decoder_module_io_in_valid; // @[DEF.scala 250:35]
  wire [9:0] diff_decoder_module_io_in_bits; // @[DEF.scala 250:35]
  wire  diff_decoder_module_io_out_valid; // @[DEF.scala 250:35]
  wire [9:0] diff_decoder_module_io_out_bits; // @[DEF.scala 250:35]
  reg [9:0] _T; // @[DEF.scala 253:45]
  reg  _T_1; // @[DEF.scala 254:45]
  reg  _T_2; // @[DEF.scala 255:25]
  reg [9:0] _T_3; // @[DEF.scala 258:47]
  reg  _T_4; // @[DEF.scala 259:47]
  reg  _T_5; // @[DEF.scala 260:47]
  reg [9:0] _T_6; // @[DEF.scala 263:45]
  reg  _T_7; // @[DEF.scala 264:45]
  reg  _T_8; // @[DEF.scala 265:45]
  reg [9:0] _T_9; // @[DEF.scala 268:27]
  reg  _T_10; // @[DEF.scala 269:27]
  decorrelator decorrelator_module ( // @[DEF.scala 248:35]
    .clock(decorrelator_module_clock),
    .reset(decorrelator_module_reset),
    .io_in_ready(decorrelator_module_io_in_ready),
    .io_in_valid(decorrelator_module_io_in_valid),
    .io_in_bits(decorrelator_module_io_in_bits),
    .io_out_ready(decorrelator_module_io_out_ready),
    .io_out_valid(decorrelator_module_io_out_valid),
    .io_out_bits(decorrelator_module_io_out_bits)
  );
  sint_to_int sint_to_int_module ( // @[DEF.scala 249:35]
    .io_in_ready(sint_to_int_module_io_in_ready),
    .io_in_valid(sint_to_int_module_io_in_valid),
    .io_in_bits(sint_to_int_module_io_in_bits),
    .io_out_ready(sint_to_int_module_io_out_ready),
    .io_out_valid(sint_to_int_module_io_out_valid),
    .io_out_bits(sint_to_int_module_io_out_bits)
  );
  diff_decoder diff_decoder_module ( // @[DEF.scala 250:35]
    .clock(diff_decoder_module_clock),
    .reset(diff_decoder_module_reset),
    .io_in_ready(diff_decoder_module_io_in_ready),
    .io_in_valid(diff_decoder_module_io_in_valid),
    .io_in_bits(diff_decoder_module_io_in_bits),
    .io_out_valid(diff_decoder_module_io_out_valid),
    .io_out_bits(diff_decoder_module_io_out_bits)
  );
  assign io_in_ready = _T_2; // @[DEF.scala 255:15]
  assign io_out_valid = _T_10; // @[DEF.scala 269:17]
  assign io_out_bits = _T_9; // @[DEF.scala 268:17]
  assign decorrelator_module_clock = clock;
  assign decorrelator_module_reset = reset;
  assign decorrelator_module_io_in_valid = _T_1; // @[DEF.scala 254:35]
  assign decorrelator_module_io_in_bits = _T; // @[DEF.scala 253:35]
  assign decorrelator_module_io_out_ready = _T_5; // @[DEF.scala 260:37]
  assign sint_to_int_module_io_in_valid = _T_4; // @[DEF.scala 259:37]
  assign sint_to_int_module_io_in_bits = _T_3; // @[DEF.scala 258:37]
  assign sint_to_int_module_io_out_ready = _T_8; // @[DEF.scala 265:35]
  assign diff_decoder_module_clock = clock;
  assign diff_decoder_module_reset = reset;
  assign diff_decoder_module_io_in_valid = _T_7; // @[DEF.scala 264:35]
  assign diff_decoder_module_io_in_bits = _T_6; // @[DEF.scala 263:35]
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
    _T_2 <= decorrelator_module_io_in_ready;
    _T_3 <= decorrelator_module_io_out_bits;
    _T_4 <= decorrelator_module_io_out_valid;
    _T_5 <= sint_to_int_module_io_in_ready;
    _T_6 <= sint_to_int_module_io_out_bits;
    _T_7 <= sint_to_int_module_io_out_valid;
    _T_8 <= diff_decoder_module_io_in_ready;
    _T_9 <= diff_decoder_module_io_out_bits;
    _T_10 <= diff_decoder_module_io_out_valid;
  end
endmodule
