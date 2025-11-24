import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF2C3E50);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: MyMainWidget(),
      theme: ThemeData(
        iconTheme: IconThemeData(size: 50),
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// 🔹 Clase principal
class MyMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconTheme = Theme.of(context).iconTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Widget principal')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person, size: iconTheme.size,)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Perfil de Usuario", style: textTheme.headlineMedium),
            ],
          ),
          TextField(
            decoration: InputDecoration(label: Text("Nombre completo")),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Indica tu nivel de experiencia",
                style: textTheme.bodyLarge,
              ),
            ],
          ),
          Slider(
            value: 5,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: (value) {},
          ),
          ElevatedButton(onPressed: () {}, child: Text("Guardar perfil")),
        ],
      ),
    );
  }
}
