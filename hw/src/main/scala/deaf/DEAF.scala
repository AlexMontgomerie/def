// See README.md for license details.

package deaf

import chisel3._
import chisel3.util._



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

  // remove ready signal from buffer
  buffer.io.deq.nodeq()

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
    buffer.io.enq.bits  := 0.U
    buffer.io.enq.valid := false.B
    io.out.bits   := 0.U
    io.out.valid  := false.B
  }

}

class deaf_encoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })
  
  // initialise modules
  val int_to_sint_module  = Module(new int_to_sint(width))
  val diff_encoder_module = Module(new diff_encoder(width, depth))
  val correlator_module   = Module(new correlator(width))

  // wire connections
  diff_encoder_module.io.in <> io.in 
  int_to_sint_module.io.in  <> diff_encoder_module.io.out
  correlator_module.io.in   <> int_to_sint_module.io.out
  io.out  <> correlator_module.io.out

}

class deaf_decoder(val width:Int, val depth:Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })
  
  // initialise modules
  val sint_to_int_module  = Module(new sint_to_int(width))
  val diff_decoder_module = Module(new diff_decoder(width, depth))
  val decorrelator_module = Module(new decorrelator(width))

  // wire connections
  decorrelator_module.io.in <> io.in 
  sint_to_int_module.io.in  <> decorrelator_module.io.out
  diff_decoder_module.io.in <> sint_to_int_module.io.out
  io.out   <> diff_decoder_module.io.out

}

/*
class s_axis(val data_width: Int) extends Bundle {

  val data  = Input(UInt(data_width.W))
  val last  = Input(Bool())
  val valid = Input(Bool())
  val ready = Output(Bool())

  def deq(): UInt = {
    ready := true.B
    data
  }

  def nodeq() = {
    ready := false.B
  }

}

class m_axis(val data_width: Int) extends Bundle {

  val data  = Output(UInt(data_width.W))
  val last  = Output(Bool())
  val valid = Output(Bool())
  val ready = Input(Bool())

  def enq(dat: UInt) = {
    valid := true.B
    data  := dat
    last  := false.B
  }
  
  def noenq() = {
    valid := false.B
    data  := DontCare
    last  := false.B
  }

  def enq_last(dat: UInt) = {
    valid := true.B
    data  := dat
    last  := true.B
  }

}


class s_axis_test(val width:Int) extends Module {
  val io = IO(new Bundle {
    val in  = new s_axis(data_width = width)
    val out = new m_axis(data_width = width)
  })

  io.in.nodeq()
  io.out.enq( 0.U )
  
}
*/


