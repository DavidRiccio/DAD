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

class MyMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget principal')),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [MyWidget("Work and Job", Icon(Icons.work)),SizedBox(width: 20,),MyWidget("Health and safety", Icon(Icons.health_and_safety)),SizedBox(width: 20,),MyWidget("Home", Icon(Icons.home))]))
      );
  }
}

class MyWidget extends StatelessWidget {
  final String nombre;
  final Icon icono;

  const MyWidget(this.nombre, this.icono, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 200,width: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Card(
        elevation: 20,
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(onPressed: (){}, child: this.icono),SizedBox(height: 10), Text(this.nombre)],
          ),
        ),
      ),
    );
  }
}
