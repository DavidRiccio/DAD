import 'package:flutter/material.dart';

void main() {
  runApp(const MiniJuegoEstado());
}

class MiniJuegoEstado extends StatefulWidget {
  const MiniJuegoEstado({super.key});

  @override
  State<MiniJuegoEstado> createState() => _MiniJuegoEstadoState();
}

class _MiniJuegoEstadoState extends State<MiniJuegoEstado> {
  int energia = 50;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mini-juego: Gestión de estado"),
        ),
        body: const Center(
          child: Text("Aquí irá tu mini-juego"),
        ),
      ),
    );
  }
}