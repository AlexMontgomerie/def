package deaf.test

import deaf._

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import org.scalatest.{Matchers, FlatSpec}

class int_to_sint_tester(c: int_to_sint) extends PeekPokeTester(c) {

  poke(c.io.in.valid, 1)
  
  // check zero
  poke(c.io.in.bits, 0)
  step(1)
  expect(c.io.out.bits, 0)

  // check +ve value
  poke(c.io.in.bits, 10)
  step(1)
  expect(c.io.out.bits, 10)

  // check -ve value
  poke(c.io.in.bits, -5 & (1 << c.width)-1 )
  step(1)
  expect(c.io.out.bits, ( 5 | ( 1 << (c.width-1) ) ) )

  // check max -ve value
  poke(c.io.in.bits, ( 1 << (c.width-1)) )
  step(1)
  expect(c.io.out.bits, (1 << c.width)-1 )

}

class correlator_tester(c: correlator) extends PeekPokeTester(c) {

  poke(c.io.in.valid, 1)
  
  var prev = 0
  for(i <- 0 to 100) {
    // update variable
    prev = prev ^ i
    // perform HW test
    poke(c.io.in.bits,i)
    step(1)
    expect(c.io.out.bits, prev )
  }

}


class correlator_tester(c: correlator) extends PeekPokeTester(c) {

  poke(c.io.in.valid, 1)
  
  var prev = 0
  for(i <- 0 to 100) {
    // update variable
    prev = prev ^ i
    // perform HW test
    poke(c.io.in.bits,i)
    step(1)
    expect(c.io.out.bits, prev )
  }

}

class DEAFTester extends ChiselFlatSpec {
  "int_to_sint" should s"be correct" in {
    Driver(() => new int_to_sint(8)) { c => new int_to_sint_tester(c) } should be (true)
  }
  "correlator" should s"be correct" in {
    Driver(() => new correlator(8)) { c => new correlator_tester(c) } should be (true)
  }

}

