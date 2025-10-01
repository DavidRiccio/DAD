void main(){
List<String> mayusculas(List<String> nombres ){
List<String> nombresMayus = [];
nombres.forEach((nombre) => nombresMayus.add(nombre.toUpperCase()));
return nombresMayus;
}
print(mayusculas(['David','pepe']));
}
