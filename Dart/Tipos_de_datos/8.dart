import 'dart:math';

void main(){
List<num> cuadrado(int n)=>  List.generate(n, (int i) => (i +1) * (i+1)); 
print (cuadrado(10));
}
