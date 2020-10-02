bitwidth=$1
channels=$2

echo "bitwidth: ${bitwidth}, channels: ${channels}"

cat <<EOF > _temphelper.scala
package _temphelper
object Elaborate extends App {
  chisel3.Driver.execute(args, () => new DEF.def_encoder($bitwidth,$channels))
}
EOF

echo "Elaborating encoder ..."
sbt "runMain _temphelper.Elaborate --target-dir impl"
echo "Elaborated Verilog available at encoder.v"

cat <<EOF > _temphelper.scala
package _temphelper
object Elaborate extends App {
  chisel3.Driver.execute(args, () => new DEF.def_decoder($bitwidth,$channels))
}
EOF

echo "Elaborating decoder ..."
sbt "runMain _temphelper.Elaborate --target-dir impl"
echo "Elaborated Verilog available at decoder.v"

