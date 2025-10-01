
List<int> codigoSecreto = [82, 118, 102, 32, 109, 98, 33, 103, 118, 102, 115, 98, 32, 117, 102 ,32, 98, 110, 112 ,106, 122, 111, 98, 111, 102];

void main(){
 String decodificar(List<int> codigo){
   List<String> codigo= [];
   for (var numero in codigoSecreto) {
    codigo.add((String.fromCharCode(numero - 1)));
   }
   return codigo.join(" ");
 }
print(decodificar(codigoSecreto));
}