;buildInfoPackage: chisel3, version: 3.2.6, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit int_to_sint : 
  module int_to_sint : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg reg : UInt<8>, clock @[DEAF.scala 15:16]
    node _T = bits(io.in, 7, 7) @[DEAF.scala 17:14]
    node _T_1 = eq(_T, UInt<1>("h01")) @[DEAF.scala 17:24]
    when _T_1 : @[DEAF.scala 17:34]
      node _T_2 = bits(io.in, 6, 0) @[DEAF.scala 18:16]
      node _T_3 = eq(_T_2, UInt<1>("h00")) @[DEAF.scala 18:28]
      when _T_3 : @[DEAF.scala 18:38]
        node _T_4 = bits(io.in, 6, 0) @[DEAF.scala 19:35]
        node _T_5 = not(_T_4) @[DEAF.scala 19:29]
        node _T_6 = cat(UInt<1>("h01"), _T_5) @[Cat.scala 29:58]
        reg <= _T_6 @[DEAF.scala 19:11]
        skip @[DEAF.scala 18:38]
      else : @[DEAF.scala 20:18]
        node _T_7 = bits(io.in, 6, 0) @[DEAF.scala 21:35]
        node _T_8 = not(_T_7) @[DEAF.scala 21:29]
        node _T_9 = add(_T_8, UInt<1>("h01")) @[DEAF.scala 21:47]
        node _T_10 = tail(_T_9, 1) @[DEAF.scala 21:47]
        node _T_11 = cat(UInt<1>("h01"), _T_10) @[Cat.scala 29:58]
        reg <= _T_11 @[DEAF.scala 21:11]
        skip @[DEAF.scala 20:18]
      skip @[DEAF.scala 17:34]
    else : @[DEAF.scala 23:16]
      reg <= io.in @[DEAF.scala 24:9]
      skip @[DEAF.scala 23:16]
    io.out <= reg @[DEAF.scala 28:10]
    
