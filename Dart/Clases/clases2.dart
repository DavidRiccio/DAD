

class Pelicula{
  String titulo;
  int anio;

  Pelicula(this.titulo, this.anio);
}

class Tarea{
  String descripcion;
  bool completada;

  Tarea(this.descripcion,this.completada);
  Tarea.pendiente(this.descripcion) : completada = false;
  }

class Circulo{
  double radio;
  double area;

  Circulo(this.radio) : area = 3.14 * radio * radio;
  
  }

class Mensaje{

  String texto;
  String prioridad;

  Mensaje(this.texto, {this.prioridad = "normal"});
}

class Moneda {
final String simbolo, codigo;
const Moneda(this.simbolo, this.codigo);
}

class Alumno{
  String nombre;
  int nota;
  Alumno(this.nombre,this.nota);

  Alumno.aprobado(String nombre) : this(nombre, 5);
}

class Sesion{
  static final Sesion _instancia = Sesion._interna();

  factory Sesion() {
return _instancia;
}
Sesion._interna();
}
void main(){
  /* Ejercicio1 */
  var p = Pelicula('Titanic', 1999);
  print("${p.anio}, ${p.titulo}");


  /* Ejercicio2 */
  var p1 = Tarea("Fregar", true);
  var p2 = Tarea.pendiente("Limpiar");

  print("${p1.descripcion}, ${p1.completada}");
  print("${p2.descripcion}, ${p2.completada}");


  /* Ejercicio3 */

  var c = Circulo(4);
  print("${c.area} radio: ${c.radio}");

  /* Ejercicio4 */

  var m = Mensaje("buenas tades");
  var m2 = Mensaje("buenas tardes", prioridad: "Alta");

  print("${m.texto} prioridad: ${m.prioridad}");
  print("${m2.texto} prioridad: ${m2.prioridad}");

  /* Ejercicio5 */

  var moneda1 = const Moneda("€","EUR");
  var moneda2 = const Moneda("€","EUR");

  print(identical(moneda2, moneda1));

  /* Ejercicio6 */

  var alumno1= Alumno.aprobado("Juan");
  var alumno2=Alumno("pepe", 4);

  print("Alumno 1: ${alumno2.nombre} ${alumno2.nota} ${alumno1.nombre} ${alumno1.nota}");


  /* Ejercicio7 */
  var c1 = Sesion();
  var c2 = Sesion();
  print(identical(c1, c2));
}









