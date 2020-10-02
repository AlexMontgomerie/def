;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit def_encoder : 
  module Queue : 
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
    
  module diff_encoder : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    inst buffer of Queue @[DEF.scala 70:22]
    buffer.clock <= clock
    buffer.reset <= reset
    reg counter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[DEF.scala 73:24]
    buffer.io.deq.ready <= UInt<1>("h00") @[Decoupled.scala 72:20]
    io.in.ready <= buffer.io.enq.ready @[DEF.scala 79:15]
    node _T = and(io.in.valid, io.out.ready) @[DEF.scala 82:21]
    when _T : @[DEF.scala 82:39]
      node _T_1 = lt(counter, UInt<4>("h0a")) @[DEF.scala 84:19]
      when _T_1 : @[DEF.scala 84:31]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        io.out.bits <= io.in.bits @[Decoupled.scala 48:19]
        node _T_2 = add(counter, UInt<1>("h01")) @[DEF.scala 86:26]
        node _T_3 = tail(_T_2, 1) @[DEF.scala 86:26]
        counter <= _T_3 @[DEF.scala 86:15]
        skip @[DEF.scala 84:31]
      else : @[DEF.scala 87:39]
        when buffer.io.deq.valid : @[DEF.scala 87:39]
          io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
          buffer.io.deq.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
          node _T_4 = sub(io.in.bits, buffer.io.deq.bits) @[DEF.scala 88:31]
          node _T_5 = tail(_T_4, 1) @[DEF.scala 88:31]
          io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
          io.out.bits <= _T_5 @[Decoupled.scala 48:19]
          skip @[DEF.scala 87:39]
        else : @[DEF.scala 89:17]
          io.out.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
          io.out.bits is invalid @[Decoupled.scala 57:19]
          skip @[DEF.scala 89:17]
      skip @[DEF.scala 82:39]
    else : @[DEF.scala 92:14]
      io.out.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      io.out.bits is invalid @[Decoupled.scala 57:19]
      skip @[DEF.scala 92:14]
    when io.in.valid : @[DEF.scala 97:23]
      io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
      buffer.io.enq.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
      buffer.io.enq.bits <= io.in.bits @[Decoupled.scala 48:19]
      skip @[DEF.scala 97:23]
    else : @[DEF.scala 99:15]
      buffer.io.enq.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      buffer.io.enq.bits is invalid @[Decoupled.scala 57:19]
      skip @[DEF.scala 99:15]
    
  module int_to_sint : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    node _T = bits(io.in.bits, 9, 9) @[DEF.scala 19:19]
    node _T_1 = eq(_T, UInt<1>("h01")) @[DEF.scala 19:29]
    when _T_1 : @[DEF.scala 19:39]
      node _T_2 = bits(io.in.bits, 8, 0) @[DEF.scala 20:21]
      node _T_3 = eq(_T_2, UInt<1>("h00")) @[DEF.scala 20:33]
      when _T_3 : @[DEF.scala 20:43]
        node _T_4 = bits(io.in.bits, 8, 0) @[DEF.scala 21:48]
        node _T_5 = not(_T_4) @[DEF.scala 21:37]
        node _T_6 = cat(UInt<1>("h01"), _T_5) @[Cat.scala 29:58]
        io.out.bits <= _T_6 @[DEF.scala 21:19]
        skip @[DEF.scala 20:43]
      else : @[DEF.scala 22:18]
        node _T_7 = bits(io.in.bits, 8, 0) @[DEF.scala 23:48]
        node _T_8 = not(_T_7) @[DEF.scala 23:37]
        node _T_9 = add(_T_8, UInt<1>("h01")) @[DEF.scala 23:60]
        node _T_10 = tail(_T_9, 1) @[DEF.scala 23:60]
        node _T_11 = cat(UInt<1>("h01"), _T_10) @[Cat.scala 29:58]
        io.out.bits <= _T_11 @[DEF.scala 23:19]
        skip @[DEF.scala 22:18]
      skip @[DEF.scala 19:39]
    else : @[DEF.scala 25:16]
      io.out.bits <= io.in.bits @[DEF.scala 26:17]
      skip @[DEF.scala 25:16]
    io.out.valid <= io.in.valid @[DEF.scala 30:17]
    io.in.ready <= io.out.ready @[DEF.scala 31:17]
    
  module Queue_1 : 
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
    
  module correlator : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    inst buffer of Queue_1 @[DEF.scala 155:22]
    buffer.clock <= clock
    buffer.reset <= reset
    io.in.ready <= buffer.io.enq.ready @[DEF.scala 158:15]
    io.out.bits <= buffer.io.deq.bits @[DEF.scala 161:10]
    io.out.valid <= buffer.io.deq.valid @[DEF.scala 161:10]
    buffer.io.deq.ready <= io.out.ready @[DEF.scala 161:10]
    node _T = and(io.in.valid, io.out.ready) @[DEF.scala 164:21]
    when _T : @[DEF.scala 164:39]
      node _T_1 = eq(buffer.io.count, UInt<1>("h00")) @[DEF.scala 165:27]
      when _T_1 : @[DEF.scala 165:37]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        buffer.io.enq.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        buffer.io.enq.bits <= io.in.bits @[Decoupled.scala 48:19]
        skip @[DEF.scala 165:37]
      else : @[DEF.scala 167:18]
        io.in.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        buffer.io.deq.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
        node _T_2 = xor(io.in.bits, buffer.io.deq.bits) @[DEF.scala 168:38]
        buffer.io.enq.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
        buffer.io.enq.bits <= _T_2 @[Decoupled.scala 48:19]
        skip @[DEF.scala 167:18]
      skip @[DEF.scala 164:39]
    else : @[DEF.scala 170:16]
      buffer.io.enq.valid <= UInt<1>("h00") @[Decoupled.scala 56:20]
      buffer.io.enq.bits is invalid @[Decoupled.scala 57:19]
      skip @[DEF.scala 170:16]
    
  module def_encoder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<10>}}
    
    inst diff_encoder_module of diff_encoder @[DEF.scala 214:35]
    diff_encoder_module.clock <= clock
    diff_encoder_module.reset <= reset
    inst int_to_sint_module of int_to_sint @[DEF.scala 215:35]
    int_to_sint_module.clock <= clock
    int_to_sint_module.reset <= reset
    inst correlator_module of correlator @[DEF.scala 216:35]
    correlator_module.clock <= clock
    correlator_module.reset <= reset
    reg _T : UInt, clock @[DEF.scala 219:45]
    _T <= io.in.bits @[DEF.scala 219:45]
    diff_encoder_module.io.in.bits <= _T @[DEF.scala 219:35]
    reg _T_1 : UInt<1>, clock @[DEF.scala 220:45]
    _T_1 <= io.in.valid @[DEF.scala 220:45]
    diff_encoder_module.io.in.valid <= _T_1 @[DEF.scala 220:35]
    reg _T_2 : UInt<1>, clock @[DEF.scala 221:25]
    _T_2 <= diff_encoder_module.io.in.ready @[DEF.scala 221:25]
    io.in.ready <= _T_2 @[DEF.scala 221:15]
    reg _T_3 : UInt, clock @[DEF.scala 224:47]
    _T_3 <= diff_encoder_module.io.out.bits @[DEF.scala 224:47]
    int_to_sint_module.io.in.bits <= _T_3 @[DEF.scala 224:37]
    reg _T_4 : UInt<1>, clock @[DEF.scala 225:47]
    _T_4 <= diff_encoder_module.io.out.valid @[DEF.scala 225:47]
    int_to_sint_module.io.in.valid <= _T_4 @[DEF.scala 225:37]
    reg _T_5 : UInt<1>, clock @[DEF.scala 226:47]
    _T_5 <= int_to_sint_module.io.in.ready @[DEF.scala 226:47]
    diff_encoder_module.io.out.ready <= _T_5 @[DEF.scala 226:37]
    reg _T_6 : UInt, clock @[DEF.scala 229:45]
    _T_6 <= int_to_sint_module.io.out.bits @[DEF.scala 229:45]
    correlator_module.io.in.bits <= _T_6 @[DEF.scala 229:35]
    reg _T_7 : UInt<1>, clock @[DEF.scala 230:45]
    _T_7 <= int_to_sint_module.io.out.valid @[DEF.scala 230:45]
    correlator_module.io.in.valid <= _T_7 @[DEF.scala 230:35]
    reg _T_8 : UInt<1>, clock @[DEF.scala 231:45]
    _T_8 <= correlator_module.io.in.ready @[DEF.scala 231:45]
    int_to_sint_module.io.out.ready <= _T_8 @[DEF.scala 231:35]
    reg _T_9 : UInt, clock @[DEF.scala 234:27]
    _T_9 <= correlator_module.io.out.bits @[DEF.scala 234:27]
    io.out.bits <= _T_9 @[DEF.scala 234:17]
    reg _T_10 : UInt<1>, clock @[DEF.scala 235:27]
    _T_10 <= correlator_module.io.out.valid @[DEF.scala 235:27]
    io.out.valid <= _T_10 @[DEF.scala 235:17]
    reg _T_11 : UInt<1>, clock @[DEF.scala 236:44]
    _T_11 <= io.out.ready @[DEF.scala 236:44]
    correlator_module.io.out.ready <= _T_11 @[DEF.scala 236:34]
    
