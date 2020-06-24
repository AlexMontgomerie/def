package deaf.test

import deaf._

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class int_to_sint_tester(c: int_to_sint) extends PeekPokeTester(c) {


}

class DEAFTester extends ChiselFlatSpec {
  // int to sint unit tester
    Driver(() => new int_to_sint(8), "verilator") { c => new int_to_sint_tester(c) } should be (true)
}
