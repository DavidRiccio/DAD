import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fotos históricas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SecondPage()),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Toca la imagen",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Hero(
                  tag: "demo",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/img/berlin.avif",
                      fit: BoxFit.cover,
                      width: 300,
                      height: 130,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de la tarjeta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Hero(
                  tag: "demo",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/img/berlin.avif",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 430,
                    ),
                  ),
                ),
              ),
              Text("Konrad Schumman",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              const Text(
                'La imagen muestra a Konrad Schumann, un joven guardia de Alemania Oriental, '
                'en el instante en que salta sobre el alambre fronterizo que marcaba el '
                'inicio de la construcción del Muro de Berlín, levantado por la Alemania comunista, '
                'para escapar hacia Berlín Oeste en 1961.',
                textAlign: TextAlign.justify,style: TextStyle(fontSize: 12,),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Volver"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
