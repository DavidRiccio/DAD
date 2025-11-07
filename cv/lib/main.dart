import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './colors.dart';
import './widgets/half_circle_avatar.dart';
import './painters/half_circle_body_painter.dart';
import './widgets/experience_timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curriculum Vitae - Carolina Chocontá',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          // Nombre principal
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 52.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2.0,
          ),
          // Títulos del Sidebar
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
          // Encabezados principales (EXPERIENCIA LABORAL, EDUCACIÓN)
          titleLarge: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
          // Títulos de trabajo y grado
          titleMedium: GoogleFonts.montserrat(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          // Profesión
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 18.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          // --- MODIFICADO ---
          // Texto general, descripciones y "edad"
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 14.0,
            color: Colors.black87,
            height: 1.3,
            fontWeight: FontWeight.normal, // Era FontWeight.bold
          ),
          // Períodos de tiempo
          bodySmall: GoogleFonts.montserrat(
            fontSize: 10.0,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ResumeScreen(),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // --- DATOS PARA EXPERIENCIA ---
    final List<ExperienceItem> experiences = [
      ExperienceItem(
        years: '2018 - Presente',
        title: 'NUTRICIONISTA - Centro de Salud Borcelle',
        description: '• Evaluaciones nutricionales.\n'
            '• Planes de alimentación personalizados.\n'
            '• Asesoramiento nutricional.\n'
            '• Desarrollo de planes de tratamiento integrados.',
      ),
      ExperienceItem(
        years: '2016 - 2017',
        title: 'NUTRICIONISTA - Ensigna',
        description: '• Evaluación dietética.\n'
            '• Diseño de planes de alimentación personalizados.\n'
            '• Asesoramiento nutricional.',
      ),
    ];
    // ---------------------------------

    // --- DATOS PARA EDUCACIÓN ---
    final List<ExperienceItem> educationHistory = [
      ExperienceItem(
        years: '2010 - 2015',
        title: 'LICENCIATURA EN NUTRICIÓN',
        description: 'Universidad La Sierra',
      ),
      ExperienceItem(
        years: '2004 - 2009',
        title: 'NIVEL SECUNDARIO',
        description: 'Colegio Verde Bendito',
      ),
    ];
    // ---------------------------------

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: 900.0,
          height: 1273.0,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Columna Izquierda ---
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: HalfCircleAvatar(
                          imageUrl: 'assets/foto1-removebg-preview.png',
                          size: 210,
                          strokeWidth: 12,
                          side: HalfSide.left,
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildSectionTitle('SOBRE MÍ', textTheme),
                      const SizedBox(height: 10),
                      Text(
                        'Soy una nutricionista dedicada y apasionada. Tengo 7 años de experiencia en asesoramiento nutricional personalizado y educación alimentaria.',
                        style: textTheme.bodyMedium, // <-- Ahora usa peso normal
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      _buildSectionTitle('HABILIDADES', textTheme),
                      const SizedBox(height: 10),
                      ..._buildSkillList(textTheme), // <-- Ahora usa peso normal
                      const SizedBox(height: 20),
                      _buildSectionTitle('IDIOMAS', textTheme),
                      const SizedBox(height: 10),
                      Text('Inglés intermedio', style: textTheme.bodyMedium), // <-- Ahora usa peso normal
                      const SizedBox(height: 8),
                      Container(
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: const FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.75,
                          child: ColoredBox(
                            color: primaryGreen,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildSectionTitle('CONTACTO', textTheme),
                      const SizedBox(height: 10),
                      _buildContactInfo(Icons.phone, '1234-5678', textTheme), // <-- Ahora usa peso normal
                      _buildContactInfo(
                          Icons.email, 'hola@sitioincreible.com', textTheme),
                      _buildContactInfo(
                          Icons.language, 'www.sitioincreible.com', textTheme),
                      _buildContactInfo(
                        Icons.location_on,
                        'Calle Cualquiera 123,\nCualquier Lugar',
                        textTheme,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),

              // --- Columna Derecha ---
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(color: lightGreenBg),
                    Positioned(
                      left: 75.0,
                      top: 284.0,
                      bottom: 0,
                      child: Container(
                        width: 2.0,
                        color: primaryGreen,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35.0, 35.0, 35.0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('CAROLINA', style: textTheme.headlineLarge),
                                Text('CHOCONTÁ', style:textTheme.headlineLarge),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(Icons.work_outline,
                                        color: primaryGreen, size: 22),
                                    const SizedBox(width: 10),
                                    Text('Nutricionista',
                                        style: textTheme.bodyLarge), // Sigue bold
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 32),
                                    Text('32 años de edad',
                                        style: textTheme.bodyMedium), // <-- Ahora usa peso normal
                                  ],
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                          _buildSectionHeader('EXPERIENCIA LABORAL', textTheme),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35.0)
                                .copyWith(top: 12.0),
                            child: ExperienceTimeline(experiences: experiences),
                          ),
                          const SizedBox(height: 20),
                          _buildSectionHeader('EDUCACIÓN', textTheme),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35.0)
                                .copyWith(top: 12.0),
                            child: ExperienceTimeline(experiences: educationHistory),
                          ),
                          const SizedBox(height: 35.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSectionTitle(String title, TextTheme textTheme) {
  return Container(
    width: double.infinity,
    child: Text(
      title,
      style: textTheme.headlineMedium,
    ),
  );
}

Widget _buildSectionHeader(String title, TextTheme textTheme) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    decoration: BoxDecoration(
      color: primaryGreen, // Opaco
      borderRadius: BorderRadius.circular(0),
    ),
    child: Center(
      child: Text(
        title,
        style: textTheme.titleLarge,
      ),
    ),
  );
}

List<Widget> _buildSkillList(TextTheme textTheme) {
  final skills = [
    'Habilidades de escucha activa',
    'Trabajo en equipo',
    'Orientación al cliente',
    'Solución de problemas',
    'Toma de decisiones informadas',
    'Adaptabilidad',
  ];
  return skills
      .map(
        (skill) => Padding(
          padding: const EdgeInsets.only(bottom: 4.0), // Juntas
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ',
                  style: textTheme.bodyMedium?.copyWith(color: primaryGreen)), // El '•' no es bold
              Expanded(child: Text(skill, style: textTheme.bodyMedium)), // Texto en peso normal
            ],
          ),
        ),
      )
      .toList();
}

Widget _buildContactInfo(IconData icon, String text, TextTheme textTheme) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0), // Separado
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: primaryGreen, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium, // Texto en peso normal
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}