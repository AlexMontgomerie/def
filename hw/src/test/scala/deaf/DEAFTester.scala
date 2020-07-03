package deaf.test

import deaf._

import org.scalatest._

import chisel3._
import chiseltest._
import chisel3.util._

class DEAFTest extends FlatSpec with ChiselScalatestTester with Matchers {

/*
  behavior of "int_to_sint"
  it should "function correctly" in {
    test(new s_axis_test(8)) { c =>
      
      val seq_in = Seq(0.U,1.U,3.U)

      fork {
        for(i <- seq_in.indices) {      // iterate over sequence 
          c.io.in.data.poke(seq_in(i))  // poke sequence data
          c.io.in.valid.poke(true.B)    // set valid
          fork.withRegion(Monitor) {
            while (c.io.in.ready.peek().litToBoolean == false) c.clock.step(1)
          }.joinAndStep(c.clock)
        }
      }.fork {
        for(i <- seq_in.indices) {      // iterate over sequence 
          c.io.out.ready.poke(true.B)  // poke sequence data
          fork.withRegion(Monitor) {
            while (c.io.out.valid.peek().litToBoolean == false) c.clock.step(1)
            c.io.out.valid.expect(true.B)
            c.io.out.data.expect(seq_in(i))
          }.joinAndStep(c.clock)

        }
     
      }.join()
 
    }
  }
*/


  behavior of "int_to_sint"
  it should "function correctly" in {
    test(new int_to_sint(8)) { c =>

      // module setup
      c.io.in.initSource().setSourceClock(c.clock)
      c.io.out.initSink().setSinkClock(c.clock)

      // run in parallel
      fork {
        c.io.in.enqueueSeq(Seq(
            0.U,
            10.U,
            (-5 & (1 << c.width)-1).U,
            ( 1 << (c.width-1)).U
          ))
      }.fork {
        c.io.out.expectDequeueSeq(Seq(
            0.U,
            10.U,
            ( 5 | ( 1 << (c.width-1) ) ).U,
            ( (1 << c.width)-1 ).U
          ))
      }.join()
    }
  }

  behavior of "correlator"
  it should "function correctly" in {
    test(new correlator(8)) { c =>
      
      // setup test values
      var seq_in  = Seq[UInt]()
      var seq_out = Seq[UInt]()
      var prev = 0
      for(i <- 0 to 100) {
        
        // update variable
        prev = prev ^ i
 
        // append to sequences
        seq_in  = seq_in   :+ i.U
        seq_out = seq_out  :+ prev.U

      }

      // module setup
      c.io.in.initSource().setSourceClock(c.clock)
      c.io.out.initSink().setSinkClock(c.clock)

      // run in parallel
      fork {
        for(i <- seq_in.indices) {
          c.io.in.bits.poke(seq_in(i))
          c.io.in.valid.poke(true.B)
          fork.withRegion(Monitor) {
            while (c.io.in.ready.peek().litToBoolean == false) {
              c.clock.step(1)
            }
          }.joinAndStep(c.clock)
        }
      }.fork {
        c.io.out.expectDequeueSeq(seq_out)
      }.join()
     

      //parallel(
      //  c.io.in.enqueueSeq(seq_in),
      //  c.io.out.expectDequeueSeq(seq_out)
      //)

    }
  }
 
  behavior of "decorrelator"
  it should "function correctly" in {
    test(new decorrelator(8)) { c =>
      
      // setup test values
      var seq_in  = Seq[UInt]()
      var seq_out = Seq[UInt]()
      var prev = 0
      for(i <- 0 to 100) {
        
        // update variable
        prev = prev ^ i
 
        // append to sequences
        seq_in  = seq_in   :+ i.U
        seq_out = seq_out  :+ prev.U

      }

      // module setup
      c.io.in.initSource().setSourceClock(c.clock)
      c.io.out.initSink().setSinkClock(c.clock)

      // run in parallel
      parallel(
        c.io.in.enqueueSeq(seq_out),
        c.io.out.expectDequeueSeq(seq_in)
      )

    }
  }
  
  behavior of "diff_encoder"
  it should "function correctly" in {
    test(new diff_encoder(8,3)) { c =>
      
      // setup test values
      var seq_in  = Seq[UInt]()
      var seq_out = Seq[UInt]()
      var prev = 0
      
      for(i <- 0 to c.depth-1) {
        // append to sequences
        seq_in  = seq_in   :+ i.U
        seq_out = seq_out  :+ i.U
     }
      
      for(i <- c.depth to 100) {
        // append to sequences
        seq_in  = seq_in   :+ i.U
        seq_out = seq_out  :+ c.depth.U
      }

      // module setup
      c.io.in.initSource().setSourceClock(c.clock)
      c.io.out.initSink().setSinkClock(c.clock)

      // run in parallel
      parallel(
        c.io.in.enqueueSeq(seq_in),
        c.io.out.expectDequeueSeq(seq_out)
      )

    }
  }

  behavior of "diff_decoder"
  it should "function correctly" in {
    test(new diff_decoder(8,3)) { c =>
      
      // setup test values
      var seq_in  = Seq[UInt]()
      var seq_out = Seq[UInt]()
      var prev = 0
      
      for(i <- 0 to c.depth-1) {
        // append to sequences
        seq_in  = seq_in   :+ i.U
        seq_out = seq_out  :+ i.U
     }
      
      for(i <- c.depth to 100) {
        // append to sequences
        seq_in  = seq_in   :+ i.U
        seq_out = seq_out  :+ c.depth.U
      }

      // module setup
      c.io.in.initSource().setSourceClock(c.clock)
      c.io.out.initSink().setSinkClock(c.clock)

      // run in parallel
      parallel(
        c.io.in.enqueueSeq(seq_out),
        c.io.out.expectDequeueSeq(seq_in)
      )

    }
  }

}

