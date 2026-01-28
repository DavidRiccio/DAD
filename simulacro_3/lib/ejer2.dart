import 'package:flutter/material.dart';

void main() {
  runApp(const RutasApp());
}

class RutasApp extends StatelessWidget {
  const RutasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioPage(),
      routes: {
        "/perfil": (_)=>const PerfilPage(),
        "/ajustes":(_)=> const AjustesPage()
      },
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/perfil");}, child: Text("Ir a perfil")),
           SizedBox(height: 18,),
           ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/ajustes");}, child: Text("Ir a ajustes"))
          ],
        ),
      ),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("Perfil"),
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Volver a inicio"))
          ],
        ),
      ),
    );
  }
}
class AjustesPage extends StatelessWidget {
  const AjustesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("Ajustes"),
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Volver a inicio"))
          ],
        ),
      ),
    );
  }
}