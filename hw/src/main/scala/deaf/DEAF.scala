// See README.md for license details.

package deaf

import chisel3._
import chisel3.util._
import axi._

class int_to_sint(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })

  val reg = Reg(UInt(width.W))

  when( io.in(width-1) === 1.U ) {
    when( io.in(width-2,0) === 0.U ) {
      reg := Cat( 1.U(1.W), ~io.in(width-2,0) )
    } .otherwise {
      reg := Cat( 1.U(1.W), ~io.in(width-2,0) + 1.U )
    }
  } .otherwise {
    reg := io.in
  }

  // assign output
  io.out := reg
}

