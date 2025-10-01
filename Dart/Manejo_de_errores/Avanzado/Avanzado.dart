/* Ejericicio1 */

int toIntSeguro(String valor) {
  try {
    return int.parse(valor);
  } catch (e) {
    throw FormatException("Valor inválido: $valor");
  }
}

/* Ejercicio2 */
class ElementoNoEnteroException implements Exception {
  @override
  String toString() {
    return 'ElementoNoEnteroException: elemento no es un entero.';
  }
}

int sumarLista(List<dynamic> datos) {
  int suma = 0;
  for (var valor in datos) {
    if (valor is! int) {
      throw ElementoNoEnteroException();
    }
    suma += valor;
  }
  return suma;
}


void main() {
  /* Ejercicio1 */
  List<String> valores = ["123", "abc", "45"];

  for (var valor in valores) {
    try {
      int numero = toIntSeguro(valor);
      print("Convertido: $numero");
    } on FormatException catch (e) {
      print(e);
    }
  }

  /* Ejercicio2 */
  List<dynamic> entrada = [10, 20, "hola", 5];

  try {
    int resultado = sumarLista(entrada);
    print('La suma es: $resultado');
  } catch (e) {
    print('Error: $e');
  }


}