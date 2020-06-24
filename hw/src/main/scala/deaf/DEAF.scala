// See README.md for license details.

package deaf

import chisel3._
import chisel3.util._
import axi._

/*
 * Int to Signed-Bit Int
 */
class int_to_sint(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })
  when( io.in.bits(width-1) === 1.U ) {
    when( io.in.bits(width-2,0) === 0.U ) {
      io.out.bits := Cat( 1.U(1.W), ~io.in.bits(width-2,0) )
    } .otherwise {
      io.out.bits := Cat( 1.U(1.W), ~io.in.bits(width-2,0) + 1.U )
    }
  } .otherwise {
    io.out.bits := io.in.bits
  }
  // assign valid signal
  io.out.valid  := io.in.valid
}

/*
 * Signed-Bit Int to Int
 */
class sint_to_int(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })
}

/*
 *
 */
class diff_encoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })
  
  // initialise counter
  val counter = Counter(depth)

  // initialise delay buffer
  val buffer = Pipe(io.in, depth)
 
  // increment counter until pipe filled
  when(io.in.valid && (counter.value < depth.U) ) {
    counter.inc()
  }

  // assign output
  when( counter.value < depth.U ) {
    io.out.bits   := io.in.bits
    io.out.valid  := io.in.valid
  } .otherwise { 
    io.out.bits   := io.in.bits - buffer.bits 
    io.out.valid  := buffer.valid
  }
}

/*
 * Correlator
 */
class correlator(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })

  // initialise buffer
  val buffer        = RegInit(0.U(width.W))
  val buffer_valid  = RegInit(0.U(1.W)) 
  
  // assign buffer register
  when( io.in.valid ) {
    buffer := io.in.bits ^ buffer
  }

  // assign outputs
  io.out.bits   := buffer
  io.out.valid  := RegNext(io.in.valid)
}

/*
 *
 */
class decorrelator(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })

}

/*
 *
 */
class deaf_encoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })
}

/*
 *
 */
class deaf_decoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Valid(UInt(width.W)))
    val out = Valid(UInt(width.W))
  })
}

