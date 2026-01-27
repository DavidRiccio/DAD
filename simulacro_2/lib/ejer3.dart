import 'package:flutter/material.dart';

void main() {
  runApp(const BombillaApp());
}

class BombillaApp extends StatelessWidget {
  const BombillaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BombillaPage(),
    );
  }
}

class BombillaPage extends StatefulWidget {
  const BombillaPage({super.key});

  @override
  State createState() => _BombillaPageState();
}

class _BombillaPageState extends State {
  bool encendida = false;

  void toggle() {
    setState(() {
      encendida = !encendida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animación implícita: Bombilla')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(opacity: encendida ? 1 : 0.25, duration: Duration(milliseconds: 400),child: AnimatedScale(scale: encendida ? 2 : 1, duration: Duration(milliseconds: 400),child: Text("💡",style: TextStyle(fontSize: 45),),),),
            const SizedBox(height: 18),
            Text(encendida ? "Encendida": "Apagada")

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggle,
        child: const Icon(Icons.power_settings_new),
      ),
    );
  }
}