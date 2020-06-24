# create int_to_sint
cat <<EOF > _temphelper.scala
package _temphelper
object Elaborate extends App {
  chisel3.Driver.execute(args, () => new deaf.int_to_sint(8))
}
EOF

echo "Elaborating module int_to_sint ..."
sbt "runMain _temphelper.Elaborate --target-dir impl"
echo "Elaborated Verilog available at int_to_sint.v"
