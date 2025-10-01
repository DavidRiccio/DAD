void main(){
  void onPressed(Function callback){
    callback();
  }
  onPressed((){
    print('Botón pulsado');
  });
}