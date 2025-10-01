/* Ejercicio1 */
import 'dart:collection';

List<double> notas = [4,5,7,9];
void CalcularNotas(List<double> notas) {
 notas.add(10);
 double ultimo = notas.last;
 double primero = notas.first;
 double sum = notas.reduce((value, element) => value + element);
 double media = sum / notas.length;
   
 return print("media : $media , primera: $primero, ultima: $ultimo, lista: $notas");
 }
/* Ejercicio2 */
Set correos = {"ana@mail.com", "luis@mail.com", "ana@mail.com", "pedro@mail.com"};
void UsarSet(Set correos){
print("Primer Set: $correos");
correos.add("david@mail.com");
print("Contiene: ${correos.contains("luis@mail.com")}");
print("Segundo Set: $correos");
}
/* Ejercicio3 */
Map productos = {"pan": 1.0,"leche":1.5,"huevos":2.0};
void MostrarProductos(Map productos) {
  print("leche: ${productos["leche"]}");
  productos["cafe"]=3.0;
  productos.forEach((key, value) => print("$key -> $value"),);
}
/* Ejercicio4 */
Queue<String> tareas = Queue<String>.from([
    "Lavar platos",
    "Hacer compra",
    "Estudiar"
  ]);
void MostrarTareas(Queue<String> tareas) {
  String tareaAtendida = tareas.removeFirst();
  print('Tarea atendida: $tareaAtendida');
  tareas.addLast("Pasear perro");
  print('Tareas restantes: $tareas');
}

/* Ejercicio5 */
void MostrarNumeros() {
SplayTreeSet<int> numeros = SplayTreeSet<int>();
numeros.addAll([5,2,3,9,1,4]);
print(numeros);
numeros.remove(3);
print(numeros);


}
void main(){
  /* Ejercicio1 */
CalcularNotas(notas);
/* Ejercicio2 */
UsarSet(correos);
/* Ejercicio3 */
MostrarProductos(productos);
/* Ejercicio4 */
MostrarTareas(tareas);
/* Ejercicio5 */
MostrarNumeros();


}