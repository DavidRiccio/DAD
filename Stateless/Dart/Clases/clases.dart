class Temperatura{
  double celcius; 
  Temperatura(this.celcius);
  double get farenheit => celcius * 1.8 + 32;
}

class Contrasenia{
  String _valor;
  Contrasenia(this._valor);

  set ponerContrasenia(String password) {
    if (password.length < 8){
      print("Error");
    }else{
      _valor = password;
    }
  }

}

class Empleado{
  void trabajar()=> print("Trabajar");
}

class Programador extends Empleado{
  @override
  void trabajar()=> print("Estoy programando en Dart");
}

class InstrumentoMusical{
  void tocar()=>print("soy un instrumento");
}
class Guitarra extends InstrumentoMusical{
  @override
  void tocar() {
    print("Toco la guitarra");
  }
}
class Piano extends InstrumentoMusical{
  @override
  void tocar() {
    print("Toco el piano");
  }
}

class Exportable{
  void exportar() => print("Exporto");
}

class Pdf implements Exportable{
  @override
  void exportar()=> print("Exporto pdf");

}
class ImagenPNG implements Exportable{
  @override
  void exportar()=> print("Exporto PNG");

}

mixin Recargable {
void recargar(String mensaje) {
final bateria = 100;
print("[$bateria] $mensaje");
}
}

class Linterna with Recargable{
void recargado() {
recargar("Telefono Recargado");
}
}

class Telefono with Recargable{
void recargado() {
recargar("Movil Recargado");
}
}

class RGB{
  final double r;
  final double g;
  final double b;
  const RGB(this.r,this.b,this.g);
}
void main(){

  /* Ejercicio1 */

  var t1 = Temperatura(32);
  print("${t1.celcius} ${t1.farenheit}");

  /* Ejercicio2 */

  var c1=Contrasenia("asodhnaso");
  c1.ponerContrasenia= "nasdn12321321";
  print("${c1._valor}");

  /* Ejercicio3 */


  var p1 = Empleado();
  var p2 = Programador();

  p1.trabajar();
  p2.trabajar();

  /* Ejercicio4 */

  var i1= InstrumentoMusical();
  var i2= Guitarra();
  var i3 = Piano();

  i1.tocar();
  i2.tocar();
  i3.tocar();

  /* Ejercicio5 */

  var e1= Exportable();
  var e2= Pdf();
  var e3 = ImagenPNG();

  e1.exportar();
  e2.exportar();
  e3.exportar();
  /* Ejercicio6 */

  var m1 = Linterna();
  var m2 = Telefono();

  m2.recargar("cargado");
  m1.recargar("cargado");

  /* Ejercicio7 */

}