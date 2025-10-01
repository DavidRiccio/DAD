void ejecutarOperacion(double a, double b, double Function(double, double) operacion) {
print("Resultado: ${operacion(a, b)}");
}
void main() {
ejecutarOperacion(3, 4, (x, y) => x + y); 
ejecutarOperacion(3, 4, (x, y) => x * y); 
ejecutarOperacion(3, 4, (x, y) => x / y);
ejecutarOperacion(3, 4, (x, y) => x -y);
}
