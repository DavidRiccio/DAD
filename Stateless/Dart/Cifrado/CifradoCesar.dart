String codigo = "Zlqjduglxp#Ohylrvd";

void main(){
  String decodificar(codigo){
  List<int> units = codigo.codeUnits;
  List<String> codigoFinal =[];
  for (var num in units){
    codigoFinal.add(String.fromCharCode(num - 3));
  }
  return codigoFinal.join();
  }
print(decodificar(codigo));
}