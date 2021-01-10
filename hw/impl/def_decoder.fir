;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit def_decoder : 
  module Queue : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, count : UInt<2>}
    
    cmem ram : UInt<10>[2] @[Decoupled.scala 218:16]
    reg enq_ptr_value : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Counter.scala 29:33]
    reg deq_ptr_value : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Counter.scala 29:33]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 223:33]
    node _T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _T_1 = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _T_1
    node _T_2 = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _T_2
    when do_enq : @[Decoupled.scala 229:17]
      infer mport _T_3 = ram[enq_ptr_value], clock @[Decoupled.scala 230:8]
      _T_3 <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(enq_ptr_value, UInt<1>("h01")) @[Counter.scala 38:24]
      node _T_4 = add(enq_ptr_value, UInt<1>("h01")) @[Counter.scala 39:22]
      node _T_5 = tail(_T_4, 1) @[Counter.scala 39:22]
      enq_ptr_value <= _T_5 @[Counter.scala 39:13]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(deq_ptr_value, UInt<1>("h01")) @[Counter.scala 38:24]
      node _T_6 = add(deq_ptr_value, UInt<1>("h01")) @[Counter.scala 39:22]
      node _T_7 = tail(_T_6, 1) @[Counter.scala 39:22]
      deq_ptr_value <= _T_7 @[Counter.scala 39:13]
      skip @[Decoupled.scala 233:17]
    node _T_8 = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T_8 : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _T_9 = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _T_9 @[Decoupled.scala 240:16]
    node _T_10 = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _T_10 @[Decoupled.scala 241:16]
    infer mport _T_11 = ram[deq_ptr_value], clock @[Decoupled.scala 242:21]
    io.deq.bits <= _T_11 @[Decoupled.scala 242:15]
    node _T_12 = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_T_12, 1) @[Decoupled.scala 257:32]
    node _T_13 = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _T_14 = mux(_T_13, UInt<2>("h02"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _T_15 = or(_T_14, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _T_15 @[Decoupled.scala 259:14]
    
  module decorrelator : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    inst buffer of Queue @[DEF.scala 183:22]
    buffer.clock <= clock
    buffer.reset <= reset
    buffer.io.deq.ready <= io.out.ready @[DEF.scala 186:23]
    io.in.ready <= buffer.io.enq.ready @[DEF.scala 189:15]
    node _T = and(io.in.valid, io.out.ready) @[DEF.scala 192:21]
    when _T : @[DEF.scala 192:39]
      io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
      buffer.io.enq.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
      buffer.io.enq.bits <= io.in.bits @[Decoupled.scala 48:19]
      node _T_1 = eq(buffer.io.count, UInt<1>("h00")) @[DEF.scala 194:27]
      when _T_1 : @[DEF.scala 194:37]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        io.out.bits <= io.in.bits @[Decoupled.scala 48:19]
        skip @[DEF.scala 194:37]
      else : @[DEF.scala 196:18]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        buffer.io.deq.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        node _T_2 = xor(io.in.bits, buffer.io.deq.bits) @[DEF.scala 197:31]
        io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        io.out.bits <= _T_2 @[Decoupled.scala 48:19]
        skip @[DEF.scala 196:18]
      skip @[DEF.scala 192:39]
    else : @[DEF.scala 199:16]
      buffer.io.enq.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      buffer.io.enq.bits is invalid @[Decoupled.scala 57:19]
      io.out.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      io.out.bits is invalid @[Decoupled.scala 57:19]
      skip @[DEF.scala 199:16]
    
  module sint_to_int : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    node _T = bits(io.in.bits, 9, 9) @[DEF.scala 44:19]
    node _T_1 = eq(_T, UInt<1>("h01")) @[DEF.scala 44:29]
    when _T_1 : @[DEF.scala 44:39]
      node _T_2 = bits(io.in.bits, 8, 0) @[DEF.scala 45:21]
      node _T_3 = eq(_T_2, UInt<9>("h01ff")) @[DEF.scala 45:33]
      when _T_3 : @[DEF.scala 45:60]
        node _T_4 = bits(io.in.bits, 8, 0) @[DEF.scala 46:48]
        node _T_5 = not(_T_4) @[DEF.scala 46:37]
        node _T_6 = cat(UInt<1>("h01"), _T_5) @[Cat.scala 29:58]
        io.out.bits <= _T_6 @[DEF.scala 46:19]
        skip @[DEF.scala 45:60]
      else : @[DEF.scala 47:18]
        node _T_7 = bits(io.in.bits, 8, 0) @[DEF.scala 48:48]
        node _T_8 = not(_T_7) @[DEF.scala 48:37]
        node _T_9 = add(_T_8, UInt<1>("h01")) @[DEF.scala 48:60]
        node _T_10 = tail(_T_9, 1) @[DEF.scala 48:60]
        node _T_11 = cat(UInt<1>("h01"), _T_10) @[Cat.scala 29:58]
        io.out.bits <= _T_11 @[DEF.scala 48:19]
        skip @[DEF.scala 47:18]
      skip @[DEF.scala 44:39]
    else : @[DEF.scala 50:16]
      io.out.bits <= io.in.bits @[DEF.scala 51:17]
      skip @[DEF.scala 50:16]
    io.out.valid <= io.in.valid @[DEF.scala 55:17]
    io.in.ready <= io.out.ready @[DEF.scala 56:17]
    
  module Queue_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, count : UInt<4>}
    
    cmem ram : UInt<10>[11] @[Decoupled.scala 218:16]
    reg enq_ptr_value : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 29:33]
    reg deq_ptr_value : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 29:33]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 223:33]
    node _T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _T_1 = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _T_1
    node _T_2 = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _T_2
    when do_enq : @[Decoupled.scala 229:17]
      infer mport _T_3 = ram[enq_ptr_value], clock @[Decoupled.scala 230:8]
      _T_3 <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(enq_ptr_value, UInt<4>("h0a")) @[Counter.scala 38:24]
      node _T_4 = add(enq_ptr_value, UInt<1>("h01")) @[Counter.scala 39:22]
      node _T_5 = tail(_T_4, 1) @[Counter.scala 39:22]
      enq_ptr_value <= _T_5 @[Counter.scala 39:13]
      when wrap : @[Counter.scala 41:21]
        enq_ptr_value <= UInt<1>("h00") @[Counter.scala 41:29]
        skip @[Counter.scala 41:21]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(deq_ptr_value, UInt<4>("h0a")) @[Counter.scala 38:24]
      node _T_6 = add(deq_ptr_value, UInt<1>("h01")) @[Counter.scala 39:22]
      node _T_7 = tail(_T_6, 1) @[Counter.scala 39:22]
      deq_ptr_value <= _T_7 @[Counter.scala 39:13]
      when wrap_1 : @[Counter.scala 41:21]
        deq_ptr_value <= UInt<1>("h00") @[Counter.scala 41:29]
        skip @[Counter.scala 41:21]
      skip @[Decoupled.scala 233:17]
    node _T_8 = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T_8 : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _T_9 = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _T_9 @[Decoupled.scala 240:16]
    node _T_10 = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _T_10 @[Decoupled.scala 241:16]
    infer mport _T_11 = ram[deq_ptr_value], clock @[Decoupled.scala 242:21]
    io.deq.bits <= _T_11 @[Decoupled.scala 242:15]
    node _T_12 = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_T_12, 1) @[Decoupled.scala 257:32]
    node _T_13 = mux(maybe_full, UInt<4>("h0b"), UInt<1>("h00")) @[Decoupled.scala 262:24]
    node _T_14 = gt(deq_ptr_value, enq_ptr_value) @[Decoupled.scala 264:39]
    node _T_15 = add(UInt<4>("h0b"), ptr_diff) @[Decoupled.scala 265:38]
    node _T_16 = tail(_T_15, 1) @[Decoupled.scala 265:38]
    node _T_17 = mux(_T_14, _T_16, ptr_diff) @[Decoupled.scala 264:24]
    node _T_18 = mux(ptr_match, _T_13, _T_17) @[Decoupled.scala 261:20]
    io.count <= _T_18 @[Decoupled.scala 261:14]
    
  module diff_decoder : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    inst buffer of Queue_1 @[DEF.scala 115:22]
    buffer.clock <= clock
    buffer.reset <= reset
    reg counter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[DEF.scala 118:24]
    io.in.ready <= buffer.io.enq.ready @[DEF.scala 121:15]
    buffer.io.deq.ready <= UInt<1>("h00") @[Decoupled.scala 72:20]
    when io.in.valid : @[DEF.scala 128:23]
      node _T = lt(counter, UInt<4>("h0a")) @[DEF.scala 129:19]
      when _T : @[DEF.scala 129:31]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        buffer.io.enq.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        buffer.io.enq.bits <= io.in.bits @[Decoupled.scala 48:19]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        io.out.bits <= io.in.bits @[Decoupled.scala 48:19]
        node _T_1 = add(counter, UInt<1>("h01")) @[DEF.scala 132:26]
        node _T_2 = tail(_T_1, 1) @[DEF.scala 132:26]
        counter <= _T_2 @[DEF.scala 132:15]
        skip @[DEF.scala 129:31]
      else : @[DEF.scala 133:17]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        buffer.io.deq.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        node _T_3 = add(io.in.bits, buffer.io.deq.bits) @[DEF.scala 134:31]
        node _T_4 = tail(_T_3, 1) @[DEF.scala 134:31]
        io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        io.out.bits <= _T_4 @[Decoupled.scala 48:19]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        buffer.io.deq.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        node _T_5 = add(io.in.bits, buffer.io.deq.bits) @[DEF.scala 135:38]
        node _T_6 = tail(_T_5, 1) @[DEF.scala 135:38]
        buffer.io.enq.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        buffer.io.enq.bits <= _T_6 @[Decoupled.scala 48:19]
        skip @[DEF.scala 133:17]
      skip @[DEF.scala 128:23]
    else : @[DEF.scala 138:14]
      io.out.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      io.out.bits is invalid @[Decoupled.scala 57:19]
      buffer.io.enq.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      buffer.io.enq.bits is invalid @[Decoupled.scala 57:19]
      skip @[DEF.scala 138:14]
    
  module def_decoder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    inst decorrelator_module of decorrelator @[DEF.scala 248:35]
    decorrelator_module.clock <= clock
    decorrelator_module.reset <= reset
    inst sint_to_int_module of sint_to_int @[DEF.scala 249:35]
    sint_to_int_module.clock <= clock
    sint_to_int_module.reset <= reset
    inst diff_decoder_module of diff_decoder @[DEF.scala 250:35]
    diff_decoder_module.clock <= clock
    diff_decoder_module.reset <= reset
    reg _T : UInt, clock @[DEF.scala 253:45]
    _T <= io.in.bits @[DEF.scala 253:45]
    decorrelator_module.io.in.bits <= _T @[DEF.scala 253:35]
    reg _T_1 : UInt<1>, clock @[DEF.scala 254:45]
    _T_1 <= io.in.valid @[DEF.scala 254:45]
    decorrelator_module.io.in.valid <= _T_1 @[DEF.scala 254:35]
    reg _T_2 : UInt<1>, clock @[DEF.scala 255:25]
    _T_2 <= decorrelator_module.io.in.ready @[DEF.scala 255:25]
    io.in.ready <= _T_2 @[DEF.scala 255:15]
    reg _T_3 : UInt, clock @[DEF.scala 258:47]
    _T_3 <= decorrelator_module.io.out.bits @[DEF.scala 258:47]
    sint_to_int_module.io.in.bits <= _T_3 @[DEF.scala 258:37]
    reg _T_4 : UInt<1>, clock @[DEF.scala 259:47]
    _T_4 <= decorrelator_module.io.out.valid @[DEF.scala 259:47]
    sint_to_int_module.io.in.valid <= _T_4 @[DEF.scala 259:37]
    reg _T_5 : UInt<1>, clock @[DEF.scala 260:47]
    _T_5 <= sint_to_int_module.io.in.ready @[DEF.scala 260:47]
    decorrelator_module.io.out.ready <= _T_5 @[DEF.scala 260:37]
    reg _T_6 : UInt, clock @[DEF.scala 263:45]
    _T_6 <= sint_to_int_module.io.out.bits @[DEF.scala 263:45]
    diff_decoder_module.io.in.bits <= _T_6 @[DEF.scala 263:35]
    reg _T_7 : UInt<1>, clock @[DEF.scala 264:45]
    _T_7 <= sint_to_int_module.io.out.valid @[DEF.scala 264:45]
    diff_decoder_module.io.in.valid <= _T_7 @[DEF.scala 264:35]
    reg _T_8 : UInt<1>, clock @[DEF.scala 265:45]
    _T_8 <= diff_decoder_module.io.in.ready @[DEF.scala 265:45]
    sint_to_int_module.io.out.ready <= _T_8 @[DEF.scala 265:35]
    reg _T_9 : UInt, clock @[DEF.scala 268:27]
    _T_9 <= diff_decoder_module.io.out.bits @[DEF.scala 268:27]
    io.out.bits <= _T_9 @[DEF.scala 268:17]
    reg _T_10 : UInt<1>, clock @[DEF.scala 269:27]
    _T_10 <= diff_decoder_module.io.out.valid @[DEF.scala 269:27]
    io.out.valid <= _T_10 @[DEF.scala 269:17]
    reg _T_11 : UInt<1>, clock @[DEF.scala 270:46]
    _T_11 <= io.out.ready @[DEF.scala 270:46]
    diff_decoder_module.io.out.ready <= _T_11 @[DEF.scala 270:36]
    
