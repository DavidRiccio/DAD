void dividir(int a, int b) {
  if (b == 0){
    throw ArgumentError('Error division por 0');
  }
  print(a / b);
}
class DivisionPorCeroException implements Exception {
  @override
  String toString() => "🚫 División prohibida";
}

/* Ejercicio1 */
void main() {
  try {
    dividir(10, 0);
  } catch(e){ 
    print(e);
  }

/* Ejercicio2 */
  var lista = [1, 2, 3];


  try {
    print(lista[5]); 
  } on RangeError catch(e){
    print("Error:  Indice fuera de rango ${e.message}");
  }
  
/* Ejercico3 */
  try {
    var numero = int.parse("abc"); 
    print(numero);
  } on FormatException catch(e){
        print("Error de Formato ${e.message}");


  }
  /* Ejercicio4 */
  void abrirArchivo() {
  print("📂 Archivo abierto");
  throw Exception("Error al leer archivo");
}
  try {
    abrirArchivo();
  } catch (e){
    print("$e");

  }finally{
    print("Archivo cerrado");
  }

/* Ejercicio5 */
void dividirPersonalizado(int a, int b) {
  if (b==0) {
    throw DivisionPorCeroException();
  }
  print(a / b);
}

  try {
    dividirPersonalizado(10, 0);
  } on DivisionPorCeroException catch (e) {
    print(e); 
  }

  /* Ejercicio6 */

Future<void> cargarDatos() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("Fallo de conexión");}

void cargar() async {
  try {
    await cargarDatos();
  } catch (e) {
    print("Error: no se pudieron cargar los datos");
  }
}
cargar();

}


  





