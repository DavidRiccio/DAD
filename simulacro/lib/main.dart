import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumberCheckerPage(),
    );
  }
}

class NumberCheckerPage extends StatefulWidget {
  const NumberCheckerPage({super.key});

  @override
  State createState() => _NumberCheckerPageState();
}

class _NumberCheckerPageState extends State {
  String input = '';
  String result = '';
  String _error='';
  bool isValid = false;
  void checkNumber() {
     setState(() {
      if (int.tryParse(input)==null) {
        _error ="Falta un numero";
        result = "Muy mal";
         isValid = false;

      }else{
        _error = "";
        result = "Numero correcto $input";
        isValid = true;
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comprobar número')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) {
                input = value;
                isValid = true;
              },
              decoration: const InputDecoration(
                labelText: 'Introduce un número',
              ),
            ),
            Text(_error!,style: TextStyle(color: Colors.red),),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isValid ? checkNumber : null ,
              child: const Text('Comprobar'),
            ),

            const SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
