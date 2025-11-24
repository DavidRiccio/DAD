void main(){
  Function multiplicador(int factor) {
return (int x) => x * factor;
}
  var porTres = multiplicador(3);
print(porTres(5));
}