import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';

void main() {
  runApp(MyApp());
}

// --- Definición de los colores ---

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curriculum Vitae',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleLarge: GoogleFonts.lato(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.lato(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: GoogleFonts.lato(
            fontSize: 16.0,
            color: Colors.black87,
          ),
          bodyMedium: GoogleFonts.lato(
            fontSize: 14.0,
            color: Colors.black87,
          ),
          bodySmall: GoogleFonts.lato(
            fontSize: 12.0,
            color: Colors.black54,
          ),
        ),
      ),
      home: ResumeScreen(),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Columna Izquierda
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen de perfil
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryGreen, width: 3),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQJurlqduJtyO8EES7Cppyji83FnumIy-M2yUFa4pThJl0Uafi1LRr2iaxYMP35Z5HWnHC72HaMj6Y1Y28YgXtQ1Ew8CzlDW8HPIcVO0yA',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 150,
                              height: 150,
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(primaryGreen),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 150,
                              height: 150,
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Sobre Mí
                  Text('SOBRE MÍ', style: textTheme.headlineSmall),
                  Divider(color: primaryGreen, thickness: 2, endIndent: 150),
                  SizedBox(height: 10),
                  Text(
                    'Soy una nutricionista dedicada y apasionada. Tengo 7 años de experiencia en asesoramiento nutricional personalizado y educación alimentaria.',
                    style: textTheme.bodyMedium,
                  ),
                  SizedBox(height: 30),

                  // Habilidades
                  Text('HABILIDADES', style: textTheme.headlineSmall),
                  Divider(color: primaryGreen, thickness: 2, endIndent: 150),
                  SizedBox(height: 10),
                  ..._buildSkillList(textTheme),
                  SizedBox(height: 30),

                  // Idiomas
                  Text('IDIOMAS', style: textTheme.headlineSmall),
                  Divider(color: primaryGreen, thickness: 2, endIndent: 150),
                  SizedBox(height: 10),
                  Text('Inglés intermedio', style: textTheme.bodyMedium),
                  SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(primaryGreen),
                  ),
                  SizedBox(height: 30),

                  // Contacto
                  Text('CONTACTO', style: textTheme.headlineSmall),
                  Divider(color: primaryGreen, thickness: 2, endIndent: 150),
                  SizedBox(height: 10),
                  _buildContactInfo(Icons.phone, '1234-5678', textTheme),
                  _buildContactInfo(Icons.email, 'hola@sitioincreible.com', textTheme),
                  _buildContactInfo(Icons.language, 'www.sitioincreible.com', textTheme),
                  _buildContactInfo(
                    Icons.location_on,
                    'Calle Cualquiera 123,\nCualquier Lugar',
                    textTheme,
                  ),
                ],
              ),
            ),
          ),

          // Columna Derecha
          Flexible(
            flex: 3,
            child: Container(
              color: lightGreenBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado Nombre y Profesión
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60.0,
                      left: 30.0,
                      right: 30.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CAROLINA',
                          style: textTheme.headlineLarge?.copyWith(letterSpacing: 2),
                        ),
                        Text(
                          'CHOCONTÁ',
                          style: textTheme.headlineLarge?.copyWith(letterSpacing: 2),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.person_pin, color: Colors.black, size: 24),
                            SizedBox(width: 10),
                            Text('Nutricionista', style: textTheme.bodyLarge),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, color: Colors.black, size: 24),
                            SizedBox(width: 10),
                            Text('32 años de edad', style: textTheme.bodyLarge),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Experiencia Laboral
                  _buildSectionHeader('EXPERIENCIA LABORAL', textTheme),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildExperienceEntry(
                            '2018 - Presente',
                            'NUTRICIONISTA',
                            'Centro de Salud Borcelle',
                            [
                              'Evaluaciones nutricionales.',
                              'Planes de alimentación personalizados.',
                              'Asesoramiento nutricional.',
                              'Desarrollo de planes de tratamiento integrados.',
                            ],
                            textTheme,
                          ),
                          SizedBox(height: 20),
                          _buildExperienceEntry(
                            '2016 - 2017',
                            'NUTRICIONISTA',
                            'Ensigna',
                            [
                              'Evaluación dietética.',
                              'Diseño de planes de alimentación personalizados.',
                              'Asesoramiento nutricional.',
                            ],
                            textTheme,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Educación
                  _buildSectionHeader('EDUCACIÓN', textTheme),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildEducationEntry(
                            '2010 - 2015',
                            'LICENCIATURA EN NUTRICIÓN',
                            'Universidad La Sierra',
                            textTheme,
                          ),
                          SizedBox(height: 20),
                          _buildEducationEntry(
                            '2004 - 2009',
                            'NIVEL SECUNDARIO',
                            'Colegio Verde Bendito',
                            textTheme,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Métodos auxiliares
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
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.black),
                SizedBox(width: 8),
                Flexible(child: Text(skill, style: textTheme.bodyMedium)),
              ],
            ),
          ),
        )
        .toList();
  }

  Widget _buildContactInfo(IconData icon, String text, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 20),
          SizedBox(width: 10),
          Flexible(child: Text(text, style: textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      color: primaryGreen,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
      margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Text(
        title,
        style: textTheme.titleLarge?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildExperienceEntry(
    String period,
    String title,
    String company,
    List<String> responsibilities,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(period, style: textTheme.bodySmall),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.titleMedium),
                  Text(
                    company,
                    style: textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 5),
                  ...responsibilities
                      .map(
                        (resp) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.circle, size: 6, color: Colors.black54),
                              SizedBox(width: 8),
                              Flexible(child: Text(resp, style: textTheme.bodySmall)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEducationEntry(
    String period,
    String degree,
    String institution,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(period, style: textTheme.bodySmall),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(degree, style: textTheme.titleMedium),
                  Text(institution, style: textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}      
  
