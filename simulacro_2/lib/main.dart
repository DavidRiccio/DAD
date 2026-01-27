import 'package:flutter/material.dart';

void main() {
  runApp(const ErrorAccesibleApp());
}

class ErrorAccesibleApp extends StatelessWidget {
  const ErrorAccesibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  // 1. Agregamos el tipo String? y corregimos la definición de la variable
  String? _errorMessage;

  void _validar() {
    setState(() {
      String email = _emailCtrl.text;
      if (!email.contains("@")) {
        _errorMessage = "El correo debe incluir un '@'";
      } else {
        _errorMessage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario Accesible')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Correo electrónico'),
            const SizedBox(height: 8),

            // 2. Usamos la propiedad errorText para accesibilidad nativa
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'usuario@email.com',
                errorText: _errorMessage, // Flutter anuncia esto automáticamente
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _validar,
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}