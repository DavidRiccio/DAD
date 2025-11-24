void main(){
    String presentacion(String nombre, [int edad=0])=> "Soy $nombre y tengo ${edad} años";
    print(presentacion('david',10));
}