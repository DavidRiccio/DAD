import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',

      home: BotonFavorito(),
    );
  }
}

class BotonFavorito extends StatefulWidget {
  @override
  State<BotonFavorito> createState() => _BotonFavoritoState();
}

class _BotonFavoritoState extends State<BotonFavorito> {
  bool _esFavorito = false;

  void _manejarToque() {
    setState(() {
      _esFavorito = !_esFavorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    IconData iconoSeleccionado = _esFavorito
        ? Icons.favorite
        : Icons.favorite_border;
    Color colorSeleccionado = _esFavorito ? Colors.red : Colors.grey;
    String textoBoton = _esFavorito
        ? '¡Añadido a Favoritos!'
        : 'Pulsa para Favorito';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Botón Favorito con Estado'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _manejarToque,
              child: Icon(
                iconoSeleccionado,
                color: colorSeleccionado,
                size: 100.0,
              ),
            ),

            const SizedBox(height: 20),

            Text(textoBoton, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
