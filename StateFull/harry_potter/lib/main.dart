import 'package:flutter/material.dart';

void main() {
  runApp(const EscapeRoomApp());
}

class EscapeRoomApp extends StatelessWidget {
  const EscapeRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escape Room',
      initialRoute: '/',
      routes: {
        '/': (_) => const SalaInicial(),
        '/error': (_) => const Atrapado(),
        '/victory': (_) => const Victoria(),
        '/segunda': (_) => const Pista1(),
      },
    );
  }
}

class SalaInicial extends StatelessWidget {
  const SalaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escape Room')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("1. ¿Que ataque tiene un 30% de probabilidad de acierto? "),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/error');
                },
                child: Text('Patada Ignea'),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/segunda');
                },
                child: Text('Perforador'),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/error');
                },
                child: Text('Bomba Lodo'),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/error');
                },
                child: Text('Esquirla Helada'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pista1 extends StatelessWidget {
  const Pista1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escape Room')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("2. ¿Que pokemon de estos es tipo Veneno?"),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/error');
                },
                child: Text('Dewong'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/error');
                },
                child: Text('Torterra'),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/victory');
                },
                child: Text('Swalot'),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/error');
                },
                child: Text('Marowak'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Victoria extends StatelessWidget {
  const Victoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(title: const Text('Victoria')),
      body: const Center(
        child: Text('Has escapado con éxito', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}

class Atrapado extends StatelessWidget {
  const Atrapado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(title: const Text('Game Over')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Has quedado atrapado',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/segunda");
                },
                child: Text("Volver a la pregunta"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
