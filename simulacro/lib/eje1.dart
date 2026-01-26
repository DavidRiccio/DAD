import 'package:flutter/material.dart';

void main() {
  runApp(const SemaforoApp());
}

class SemaforoApp extends StatelessWidget {
  const SemaforoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SemaforoPage(),
    );
  }
}

class SemaforoPage extends StatefulWidget {
  const SemaforoPage({super.key});

  @override
  State<SemaforoPage> createState() => _SemaforoPageState();
}

class _SemaforoPageState extends State<SemaforoPage> {
  int currentLightIndex = 0;

  void _cambiarColor() {
    setState(() {
      currentLightIndex = (currentLightIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Semáforo estático'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Luz(
                    color: currentLightIndex == 0
                        ? Colors.red
                        : Colors.blueGrey,
                  ),
                  const SizedBox(height: 12),
                  Luz(
                    color: currentLightIndex == 1
                        ? Colors.yellow
                        : Colors.blueGrey,
                  ),
                  const SizedBox(height: 12),
                  Luz(
                    color: currentLightIndex == 2
                        ? Colors.green
                        : Colors.blueGrey,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(currentLightIndex==0 ? "DETENTE INSENSATO" : currentLightIndex==1 ? "PRECAUCION MAQUINON" : "AVANZA CRACK" ,style:TextStyle(color:currentLightIndex==0 ? Colors.red : currentLightIndex==1 ? Colors.amber : Colors.green ) ,),
            ElevatedButton(
              onPressed: () {
                _cambiarColor();
              },
              child: const Text("Cambiar color"),
            ),
          ],
        ),
      ),
    );
  }
}

class Luz extends StatelessWidget {
  final Color color;

  const Luz({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
