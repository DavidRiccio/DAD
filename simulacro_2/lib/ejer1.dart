import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarritoModel extends ChangeNotifier {
  double total = 10.0;
  int item = 0;
  void add(double newTotal) {
      total += newTotal;
      item +=1;
      notifyListeners();
  }

  void clean() {
    total = 0.0;
    item = 0;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CarritoModel(),
      child: CafeteriaApp(),
    ),
  );
}

class CafeteriaApp extends StatelessWidget {
  const CafeteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CafeteriaPage(),
    );
  }
}

class CafeteriaPage extends StatelessWidget {
  const CafeteriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carrito = context.watch<CarritoModel>();
    final total = carrito.total;
    final items = carrito.item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafetería (estático)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // RESUMEN (estático)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Items: $items ', style: const TextStyle(fontSize: 18)),
                  Text('Total: $total', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // PRODUCTOS (estático)
            _Producto(nombre: 'Café', precio: 1.20),
            _Producto(nombre: 'Tostada', precio: 1.80),
            _Producto(nombre: 'Zumo', precio: 2.10),

            const Spacer(),

            // clean (estático)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  carrito.clean();
                },
                child: Text('clean carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Producto extends StatelessWidget {
  final String nombre;
  final double precio;

  const _Producto({required this.nombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    final carrito = context.watch<CarritoModel>();
    return Card(
      child: ListTile(
        title: Text(nombre),
        subtitle: Text('${precio.toStringAsFixed(2)} €'),
        trailing: ElevatedButton(
          onPressed:() {carrito.add(precio);},
          child: const Text('Añadir'),
        ),
      ),
    );
  }
}
