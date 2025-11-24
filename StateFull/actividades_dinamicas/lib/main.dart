import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class VolumenProvider extends ChangeNotifier {
  double _volumen = 50.0;

  double get volumen => _volumen;

  set volumen(double nuevoVolumen) {
    if (nuevoVolumen >= 0.0 && nuevoVolumen <= 100.0) {
      _volumen = nuevoVolumen;

      notifyListeners();
    }
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => VolumenProvider(),
      child: MiApp(),
    ),
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control de Volumen con Provider',
      home: ControlVolumen(),
    );
  }
}

class ControlVolumen extends StatefulWidget {
  const ControlVolumen({super.key});

  @override
  State<ControlVolumen> createState() => _ControlVolumenState();
}

class _ControlVolumenState extends State<ControlVolumen> {
  IconData _getIconForVolume(double currentVolume) {
    if (currentVolume == 0.0) {
      return Icons.volume_off;
    } else if (currentVolume < 50.0) {
      return Icons.volume_down;
    } else {
      return Icons.volume_up;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentVolume = context.watch<VolumenProvider>().volumen;

    final provider = context.read<VolumenProvider>();

    final iconoSeleccionado = _getIconForVolume(currentVolume);
    final colorSeleccionado = (currentVolume > 0.0)
        ? Colors.indigo
        : Colors.grey;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Volumen (Provider)'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconoSeleccionado, color: colorSeleccionado, size: 100.0),

            const SizedBox(height: 20),

            Text(
              'Volumen Actual: ${currentVolume.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Slider(
                value: currentVolume,
                min: 0,
                max: 100,
                divisions: 100,
                label: currentVolume.toStringAsFixed(0),
                onChanged: (double newValue) {
                  provider.volumen = newValue;
                },
                activeColor: Colors.black,
                inactiveColor: Colors.grey.shade300,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
