void main(){
  String saludo(String nombre, [String? apellido])=> "Hola, $nombre ${apellido ?? ""}";

print(saludo('david'));
}