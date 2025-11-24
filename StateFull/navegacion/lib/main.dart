import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: PantallaA(),
    );
  }
}

class PantallaA extends StatefulWidget {
  @override
  _PantallaAState createState() => _PantallaAState();
}

class _PantallaAState extends State<PantallaA> {
  String? mensaje = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla A')),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$mensaje',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final String? resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaB()),
                );
                  setState(() {
                    mensaje = resultado;
                  });
                
              },
              child: Text("Ir a Pantalla B"),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaB extends StatelessWidget {



  final TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla B')),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controlador,
              decoration: InputDecoration(
                  labelText: 'Introduce un nuevo valor',
                  ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String texto = controlador.text;
                
                Navigator.pop(context, texto);
              },
              child: Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}
