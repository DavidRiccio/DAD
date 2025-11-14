import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: MyMainWidget(),
    );
  }
}

// 🔹 Clase principal
class MyMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Widget principal')),
      body: Center( 
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ 
            // Pasamos los mensajes como argumentos
            Container(padding: EdgeInsets.only(left: 450,right: 450), child: MyTextField("Email or username")), 
            Container(padding: EdgeInsets.only(left: 450,right: 450,top: 20),child: MyTextField("Password"),)
          ]
        ),
      ),
    );
  }
}

// 🔹 Clase MyTextField modificada
class MyTextField extends StatelessWidget{
  final String message;

  const MyTextField(this.message, {super.key});
  
  @override
  Widget build( BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey) 
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10), 
              child: Icon(Icons.lock,color: Colors.grey,)
            ), 
            Text(message, style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
