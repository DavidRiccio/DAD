import 'package:flutter/material.dart';

void main() {
  runApp(const NavigatorBasicoApp());
}

class NavigatorBasicoApp extends StatelessWidget {
  const NavigatorBasicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioPage(),
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
            ElevatedButton(
              onPressed: () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => InfoPage()));
              },
              child: Text("Info page"),
            ),SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactPage()));
              },
              child: Text("Contact page"),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InfoPage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ Text("Contacto@gmail.com / 293849237"),SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ContactPage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Crea InfoPage (StatelessWidget)
// - Scaffold con AppBar "Info"
// - Un texto con información
// - Botón "Volver" que haga Navigator.pop

// TODO: Crea ContactoPage (StatelessWidget)
// - Scaffold con AppBar "Contacto"
// - Un texto con email/teléfono ficticio
// - Botón "Volver" que haga Navigator.pop
