import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF003366);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          background: Color(0xFFF7F3E9),
        ),
        
        // 🔹 AQUÍ ESTÁ EL CAMBIO:
        // Definimos explícitamente la fuente en cada categoría.
        // Nota cómo usamos GoogleFonts.ebGaramond(...) en lugar de TextStyle(...)
        textTheme: TextTheme(
          
          // Fuente explícita para el título grande
          headlineLarge: GoogleFonts.ebGaramond(
            fontSize: 34,
            color: seedColor,
            fontWeight: FontWeight.bold,
          ),
          
          // Fuente explícita para el subtítulo (Podrías poner otra aquí si quisieras)
          titleMedium: GoogleFonts.ebGaramond(
            fontSize: 22,
            color: seedColor,
            fontWeight: FontWeight.w600, // Un poco menos grueso que bold
          ),
          
          // Fuente explícita para el cuerpo del texto
          bodyLarge: GoogleFonts.ebGaramond(
            fontSize: 18,
            color: Color(0xFF2B2B2B),
            // fontWeight normal por defecto
          ),
        ),
      ),
      home: MyMainWidget(),
    );
  }
}

class MyMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text('Widget principal')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("DISCURSO DE GETTYSBURG", 
                  style: textTheme.headlineLarge, // Usará ebGaramond size 34
                  textAlign: TextAlign.center
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Abraham Lincoln, 19 de noviembre de 1863", 
                  style: textTheme.titleMedium, // Usará ebGaramond size 22
                  textAlign: TextAlign.center
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 700),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hace ochenta y siete años, nuestros padres hicieron nacer en este continente una nueva nación, concebida en Libertad y consagrada al principio de que todas las personas son creadas iguales. Ahora estamos envueltos en una gran guerra civil que pone a prueba si esta nación, o cualquier nación así concebida y así consagrada, puede perdurar en el tiempo...",
                  style: textTheme.bodyLarge, // Usará ebGaramond size 18
                  textAlign: TextAlign.justify,
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Saber más"))
            ],
          ),
        ),
      ),
    );
  }
}