void main(){

int sumatoria(List<int> numeros){
int suma = numeros.reduce((a, b) => a + b);
return suma;
};
print(sumatoria([3,4,6]));
}
