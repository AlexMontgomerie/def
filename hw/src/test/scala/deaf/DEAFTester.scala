package deaf.test

import deaf._

import org.scalatest._

import chisel3._
import chiseltest._
import chisel3.util._

class DEAFTest extends FlatSpec with ChiselScalatestTester with Matchers {

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

  behavior of "sint_to_int"
  it should "function correctly" in {
    test(new sint_to_int(8)) { c =>

      // module setup
      c.io.in.initSource().setSourceClock(c.clock)
      c.io.out.initSink().setSinkClock(c.clock)

      // run in parallel
      fork {
        c.io.in.enqueueSeq(Seq(
            0.U,
            10.U,
            ( 5 | ( 1 << (c.width-1) ) ).U,
            ( (1 << c.width)-1 ).U
         ))
      }.fork {
        c.io.out.expectDequeueSeq(Seq(
            0.U,
            10.U,
            (-5 & (1 << c.width)-1).U,
            ( 1 << (c.width-1)).U
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

      parallel(
        c.io.in.enqueueSeq(seq_in),
        c.io.out.expectDequeueSeq(seq_out)
      )

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

  behavior of "deaf_encoder"
  it should "function correctly" in {
    test(new deaf_encoder(8,3)) { c =>
     
      val stream_in_file  = io.Source.fromFile("data/stream_baseline.csv")
      val stream_out_file = io.Source.fromFile("data/stream_encoded.csv")

      val seq_in_raw  = stream_in_file.getLines.mkString.split(",").map(_.trim)
      val seq_out_raw = stream_out_file.getLines.mkString.split(",").map(_.trim)
      
      var seq_in  = Seq[UInt]()
      var seq_out = Seq[UInt]()
      
      for (i <- seq_in_raw  ) seq_in  = seq_in  :+ (i.toInt & ((2<<7)-1)).U
      for (i <- seq_out_raw ) seq_out = seq_out :+ (i.toInt & ((2<<7)-1)).U

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

  behavior of "deaf_decoder"
  it should "function correctly" in {
    test(new deaf_decoder(8,3)) { c =>
     
      val stream_in_file  = io.Source.fromFile("data/stream_encoded.csv")
      val stream_out_file = io.Source.fromFile("data/stream_baseline.csv")

      val seq_in_raw  = stream_in_file.getLines.mkString.split(",").map(_.trim)
      val seq_out_raw = stream_out_file.getLines.mkString.split(",").map(_.trim)
      
      var seq_in  = Seq[UInt]()
      var seq_out = Seq[UInt]()
      
      for (i <- seq_in_raw  ) seq_in  = seq_in  :+ (i.toInt & ((2<<7)-1)).U
      for (i <- seq_out_raw ) seq_out = seq_out :+ (i.toInt & ((2<<7)-1)).U

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


}

