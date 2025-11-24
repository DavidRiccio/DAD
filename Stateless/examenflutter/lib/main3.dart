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
      appBar: AppBar(title: Text('Widget principal')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [MyWidget(Icon(Icons.work,color: Colors.black,), "Trabajo", "Consulta tus tareas y proyectos diarios"),MyWidget(Icon(Icons.health_and_safety), "Salud", "Consulta informacion relacionada con tu bienestar"),MyWidget(Icon(Icons.home), "Hogar", "Organiza todos los aspectos de tu vivienda")],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  Icon icono;
  String texto;
  String descripcion;

  MyWidget(this.icono, this.texto, this.descripcion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            
            color: const Color.fromARGB(255, 228, 227, 227),
            elevation: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [icono,Column( mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, children: [ Text(texto,textAlign: TextAlign.start) ,Text(descripcion,textAlign: TextAlign.center)],
            )]),
            
          ),
        ),
        
      
      ],
    );
  }
}
