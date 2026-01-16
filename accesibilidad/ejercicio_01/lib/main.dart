import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginBase(),
    );
  }
}

class LoginBase extends StatefulWidget {
  const LoginBase({super.key});

  @override
  State<LoginBase> createState() => _LoginBaseState();
}

class _LoginBaseState extends State<LoginBase> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  String? _error;

  void _validar() {
    setState(() {
      String email = _emailCtrl.text;
      String pass = _passCtrl.text;

      if (email.isEmpty || pass.isEmpty) {
        _error = "Todos los campos son obligatorios";
      } else if (!email.contains("@")) {
        _error = "El formato del correo no es válido (falta @)";
      } else if (pass.length < 6) {
        _error = "La contraseña debe tener al menos 6 caracteres";
      } else {
        _error = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acceso')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailCtrl,

                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Correo',
                    labelText: "ejemplo@gmail.com",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,

                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passCtrl,

                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Contraseña',
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,

                  onSubmitted: (_) => _validar(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _validar,
                  child: const Text('Entrar'),
                ),

                if (_error != null) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "ERROR: $_error",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
