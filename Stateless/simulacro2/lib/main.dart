import 'package:flutter/material.dart';

void main() => runApp(MiApp());



class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: MyMainWidget(),
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 34,
            color: Color(0xFF003366),
            fontWeight: FontWeight.bold,
            fontFamily: "Garamound",
          ),
          titleMedium: TextStyle(
            fontSize: 22,
            color: Color(0xFF003366),
            fontWeight: FontWeight.bold,
            fontFamily: "Garamound",
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFF2B2B2B),
            fontWeight: FontWeight.bold,
            fontFamily: "Garamound",
          ),
          
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
    return Scaffold(backgroundColor: Color(0xFFF7F3E9),
      appBar: AppBar(title: Text('Widget principal')),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("DISCURSO DE GETTYSBURG",style: textTheme.headlineLarge)],),Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Abraham Lincoln, 19 de noviembre de 1863",style: textTheme.titleMedium)]),Padding(padding: EdgeInsets.only(left: 200,right: 200), child:  Text("Hace ochenta y siete años, nuestros padres hicieron nacer en este continente una nueva nación, concebida en Libertad y consagrada al principio de que todas las personas son creadas iguales. Ahora estamos envueltos en una gran guerra civil que pone a prueba si esta nación, o cualquier nación así concebida y así consagrada, puede perdurar en el tiempo...",style: textTheme.bodyLarge, textAlign: TextAlign.center,)),ElevatedButton(onPressed: (){},child: Text("Saber mas"),)])),
    );
  }
}
