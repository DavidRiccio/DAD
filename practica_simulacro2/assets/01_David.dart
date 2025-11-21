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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  width: 400,
                  child: Card(
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
                              Icon(Icons.person, size: 40),
                              Text("Perfil de usuario"),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.star), Text(" Puntos: 120")],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.notifications),
                            Text(" Notificaciones: 5"),
                          ],
                        ),
                        Divider(),

                        Padding(
                          padding: EdgeInsetsGeometry.all(20),
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: Text("Editar perfil"),
                          ),
                        ),
                        Divider(),

                        Padding(
                          padding: EdgeInsetsGeometry.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Opciones rapidas")],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.folder),
                            Icon(Icons.settings),
                            Icon(Icons.help),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Archivos"),
                            Text("Ajustes"),
                            Text("Ayuda"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}