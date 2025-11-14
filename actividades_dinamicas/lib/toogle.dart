import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botón Favorito',
      home: BotonFavorito(),
    );
  }
}

class BotonFavorito extends StatefulWidget {
  @override
  _BotonFavoritoState createState() => _BotonFavoritoState();
}

class _BotonFavoritoState extends State<BotonFavorito> {
  bool _esFavorito = false;
  _toggleFavorito() {
    setState(() {
      _esFavorito = !_esFavorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo con setState()')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 100,
              icon: Icon(
                _esFavorito ? Icons.favorite : Icons.favorite_border,
                color: _esFavorito ? Colors.red : Colors.grey,
              ),
              onPressed: _toggleFavorito,
            ),
            SizedBox(height: 20),
            Text(
              _esFavorito
                  ? '¡Añadido a favoritos ❤️!'
                  : 'Pulsa para marcar como favorito 🤍',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(onPressed: _toggleFavorito, child: Text("Boton",style: TextStyle( color:  _esFavorito ? Colors.amber : Colors.red)))
          ],
        ),
      ),
    );
  }
}
