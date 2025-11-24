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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),child: 
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Icon(Icons.person, size: 20),
                        )
                        ),
                      ],
                    ),
                  ),MyWidget(Icon(Icons.person), "Nombre de usuario"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.email),
                      Icon(Icons.phone),
                      Icon(Icons.telegram),
                      Icon(Icons.language),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text("Guarda aqui"),
                        icon: Icon(Icons.save),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  Icon icono;
  String texto;

  MyWidget(this.icono, this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsetsGeometry.all(20),child: 
           DecoratedBox(decoration: BoxDecoration(color: Colors.white,border: BoxBorder.all(),borderRadius: BorderRadius.circular(1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [icono,SizedBox(width: 20,),  Column( mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, children: [ Text(texto,textAlign: TextAlign.start) ],
            )]),
           )
          ),
        ]);
  }
}