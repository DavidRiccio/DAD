void main(){
  int result = 0;
   mayorDe3(int a, int b, int c){
    if (a >b && a>c){
      result = a;
    }
    if (b >c && b>a){
        result = b;
    }
    if(b < c && c>a){
        result = c;
    }
    else{
      return 'Hay numeros iguales';
    }
    return result;
  }

print(mayorDe3(4, 4, 5));
}