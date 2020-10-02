// See README.md for license details.

package DEF

import chisel3._
import chisel3.util._

import scala.math._

/*
 * Int to Signed-Bit Int
 */
class int_to_sint(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
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
  io.in.ready   := io.out.ready

}

/*
 * Signed-Bit Int to Int
 */
class sint_to_int(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })
  
  when( io.in.bits(width-1) === 1.U ) {
    when( io.in.bits(width-2,0) === ((2<<(width-2))-1).U ) {
      io.out.bits := Cat( 1.U(1.W), ~io.in.bits(width-2,0) )
    } .otherwise {
      io.out.bits := Cat( 1.U(1.W), ~io.in.bits(width-2,0) + 1.U )
    }
  } .otherwise {
    io.out.bits := io.in.bits
  }
  
  // assign valid signal
  io.out.valid  := io.in.valid
  io.in.ready   := io.out.ready

}

/*
 *
 */
class diff_encoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  // initialise buffer
  val buffer = Module( new Queue(UInt(width.W), depth+1) )

  // initialise counter
  val counter = RegInit(0.U(32.W))

  // remove ready signal from buffer
  buffer.io.deq.nodeq()

  // only ready when buffer ready
  io.in.ready := buffer.io.enq.ready

  // write output when input valid and output ready
  when( io.in.valid && io.out.ready ) {
    //when( buffer.io.count < depth.U ) {
    when( counter < depth.U ) {
      io.out.enq( io.in.deq() ) 
      counter := counter + 1.U
    }.elsewhen( buffer.io.deq.valid ) {
      io.out.enq( io.in.deq() - buffer.io.deq.deq() )
    }.otherwise {
      io.out.noenq()
    }
  }.otherwise{
    io.out.noenq()
  }
 
  // load buffer when input valid
  when( io.in.valid ) {
    buffer.io.enq.enq( io.in.deq() )
  }.otherwise {
    buffer.io.enq.noenq()
  }

}

/*
 *
 */
class diff_decoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  // initialise buffer
  val buffer = Module( new Queue(UInt(width.W), depth+1) )

  // initialise counter
  val counter = RegInit(0.U(32.W))

  // only ready when buffer ready
  io.in.ready := buffer.io.enq.ready

  // assign buffer output to module output
  buffer.io.deq.nodeq()
  //io.out <> buffer.io.deq

  // write output when input valid and output ready
  when( io.in.valid ) {
    when( counter < depth.U ) {
      buffer.io.enq.enq( io.in.deq() ) 
      io.out.enq(io.in.deq())
      counter := counter + 1.U
    }.otherwise {
      io.out.enq( io.in.deq() + buffer.io.deq.deq() )
      buffer.io.enq.enq( io.in.deq() + buffer.io.deq.deq() )
      //io.out.enq( io.in.deq() + buffer.io.deq.deq() )
    }
  }.otherwise{
    io.out.noenq()
    buffer.io.enq.noenq()
  }
 
}

/*
 * Correlator
 */
class correlator(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  // initialise buffer
  val buffer = Module( new Queue(UInt(width.W), 2) )

  // only ready when buffer ready
  io.in.ready := buffer.io.enq.ready

  // assign buffer output to module output
  io.out <> buffer.io.deq

  // assign buffer register
  when( io.in.valid && io.out.ready ) {
    when( buffer.io.count === 0.U ) {
      buffer.io.enq.enq( io.in.deq() )
    } .otherwise {
      buffer.io.enq.enq( io.in.deq() ^ buffer.io.deq.deq() )
    } 
  } .otherwise {
    buffer.io.enq.noenq()
  }

}

class decorrelator(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  // initialise buffer
  val buffer = Module( new Queue(UInt(width.W), 2) )

  // assign ready signal from out to buffer
  buffer.io.deq.ready := io.out.ready

  // only ready when buffer ready
  io.in.ready := buffer.io.enq.ready

  // assign buffer register
  when( io.in.valid && io.out.ready ) {
    buffer.io.enq.enq( io.in.deq() )
    when( buffer.io.count === 0.U ) {
      io.out.enq( io.in.deq() )
    } .otherwise {
      io.out.enq( io.in.deq() ^ buffer.io.deq.deq() )
    } 
  } .otherwise {
    buffer.io.enq.noenq()
    io.out.noenq()
  }

}

class def_encoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })


  // initialise modules
  val diff_encoder_module = Module(new diff_encoder(width, depth))
  val int_to_sint_module  = Module(new int_to_sint(width))
  val correlator_module   = Module(new correlator(width))

  // wire connections ( diff_encoder <> input )
  diff_encoder_module.io.in.bits  := RegNext(io.in.bits)
  diff_encoder_module.io.in.valid := RegNext(io.in.valid)
  io.in.ready := RegNext(diff_encoder_module.io.in.ready)

  // wire connections ( int_to_sint <> diff_encoder )
  int_to_sint_module.io.in.bits     := RegNext(diff_encoder_module.io.out.bits)
  int_to_sint_module.io.in.valid    := RegNext(diff_encoder_module.io.out.valid)
  diff_encoder_module.io.out.ready  := RegNext(int_to_sint_module.io.in.ready)
  
  // wire connections ( correlator <> int_to_sint )
  correlator_module.io.in.bits    := RegNext(int_to_sint_module.io.out.bits)
  correlator_module.io.in.valid   := RegNext(int_to_sint_module.io.out.valid)
  int_to_sint_module.io.out.ready := RegNext(correlator_module.io.in.ready)
  
  // wire connections ( output <> correlator )
  io.out.bits   := RegNext(correlator_module.io.out.bits)
  io.out.valid  := RegNext(correlator_module.io.out.valid)
  correlator_module.io.out.ready := RegNext(io.out.ready)

}

class def_decoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })
  

  // initialise modules
  val decorrelator_module = Module(new decorrelator(width))
  val sint_to_int_module  = Module(new sint_to_int(width))
  val diff_decoder_module = Module(new diff_decoder(width, depth))

  // wire connections ( diff_encoder <> input )
  decorrelator_module.io.in.bits  := RegNext(io.in.bits)
  decorrelator_module.io.in.valid := RegNext(io.in.valid)
  io.in.ready := RegNext(decorrelator_module.io.in.ready)

  // wire connections ( int_to_sint <> diff_encoder )
  sint_to_int_module.io.in.bits     := RegNext(decorrelator_module.io.out.bits)
  sint_to_int_module.io.in.valid    := RegNext(decorrelator_module.io.out.valid)
  decorrelator_module.io.out.ready  := RegNext(sint_to_int_module.io.in.ready)
  
  // wire connections ( correlator <> int_to_sint )
  diff_decoder_module.io.in.bits  := RegNext(sint_to_int_module.io.out.bits)
  diff_decoder_module.io.in.valid := RegNext(sint_to_int_module.io.out.valid)
  sint_to_int_module.io.out.ready := RegNext(diff_decoder_module.io.in.ready)
  
  // wire connections ( output <> correlator )
  io.out.bits   := RegNext(diff_decoder_module.io.out.bits)
  io.out.valid  := RegNext(diff_decoder_module.io.out.valid)
  diff_decoder_module.io.out.ready := RegNext(io.out.ready)

}


