import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart'; // Asegúrate de que este archivo defina primaryGreen y lightGreenBg

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curriculum Vitae',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          // 42.0 (Antes 32.0) - Para el nombre principal
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          // 32.0 (Antes 24.0) - Para títulos del Sidebar (SOBRE MÍ, HABILIDADES)
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          // 24.0 (Antes 18.0)
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
          // 24.0 (Antes 18.0) - Para encabezados principales (EXPERIENCIA LABORAL, EDUCACIÓN)
          titleLarge: GoogleFonts.lato(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          // 20.0 (Antes 16.0) - Para títulos de trabajo y grado
          titleMedium: GoogleFonts.lato(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          // 20.0 (Antes 16.0) - Para profesión y edad
          bodyLarge: GoogleFonts.lato(
            fontSize: 20.0,
            color: Colors.black87,
          ),
          // 18.0 (Antes 14.0) - Para texto general y descripciones de trabajo/contacto
          bodyMedium: GoogleFonts.lato(
            fontSize: 18.0,
            color: Colors.black87,
          ),
          // 15.0 (Antes 12.0) - Para períodos de tiempo
          bodySmall: GoogleFonts.lato(
            fontSize: 15.0,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
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
    
    // El color de fondo debe ser un color neutro para que el CV blanco destaque
    // Si 'lightGreenBg' es muy claro, puedes usar Colors.grey[100] o Colors.white.
    // Usaremos Colors.grey[100] para simular un documento flotante.
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      
      // 1. Envolvemos todo el cuerpo en un SingleChildScrollView para el scroll vertical
      body: SingleChildScrollView(
        child: Center(
          // 2. Limitamos el ancho del contenido del CV
          child: Container(
            // Un ancho fijo ideal para documentos web de doble columna
            width: 1000.0, 
            // La altura será determinada por el contenido
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            // Aseguramos que el contenedor base del CV sea blanco (como el papel)
            color: Colors.white, 
            
            child: Column( // Usamos Column para poder poner un pequeño padding vertical si es necesario
              children: [
                // El Row es la estructura principal de doble columna del CV
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Columna Izquierda - Sidebar
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        // Mantenemos el padding interno de la columna
                        padding: const EdgeInsets.all(50.0), 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min, // Ocupa solo el espacio necesario
                          children: [
                            // Imagen de perfil
                            Center(
                              child: SizedBox(
                                width: 280,
                                height: 280,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQJurlqduJtyO8EES7Cppyji83FnumIy-M2yUFa4pThJl0Uafi1LRr2iaxYMP35Z5HWnHC72HaMj6Y1Y28YgXtQ1Ew8CzlDW8HPIcVO0yA',
                                        width: 280,
                                        height: 280,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Container(
                                            width: 280,
                                            height: 280,
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
                                            width: 280,
                                            height: 280,
                                            color: Colors.grey[300],
                                            child: Icon(Icons.person, size: 140, color: Colors.white),
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      child: ClipRect(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: 0.5,
                                          child: Container(
                                            width: 280,
                                            height: 280,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: primaryGreen, width: 7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40), 
                            
                            // Sobre Mí
                            _buildSectionTitle('SOBRE MÍ', textTheme),
                            SizedBox(height: 16), 
                            Text(
                              'Soy una nutricionista dedicada y apasionada. Tengo 7 años de experiencia en asesoramiento nutricional personalizado y educación alimentaria.', 
                              style: textTheme.bodyMedium,
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 40), 

                            // Habilidades
                            _buildSectionTitle('HABILIDADES', textTheme),
                            SizedBox(height: 16), 
                            ..._buildSkillList(textTheme),
                            SizedBox(height: 40), 

                            // Idiomas
                            _buildSectionTitle('IDIOMAS', textTheme),
                            SizedBox(height: 16), 
                            Text('Inglés intermedio', style: textTheme.bodyMedium),
                            SizedBox(height: 12), 
                            Container(
                              height: 16, 
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primaryGreen,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40), 

                            // Contacto
                            _buildSectionTitle('CONTACTO', textTheme),
                            SizedBox(height: 16), 
                            _buildContactInfo(Icons.phone, '1234-5678', textTheme),
                            _buildContactInfo(
                                Icons.email, 'hola@sitioincreible.com', textTheme),
                            _buildContactInfo(
                                Icons.language, 'www.sitioincreible.com', textTheme),
                            _buildContactInfo(
                              Icons.location_on,
                              'Calle Cualquiera 123,\nCualquier Lugar',
                              textTheme,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Columna Derecha - Contenido Principal
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: lightGreenBg,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min, // Ocupa solo el espacio necesario
                          children: [
                            // Encabezado Nombre y Profesión
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 75.0,
                                left: 50.0,
                                right: 50.0,
                                bottom: 30.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CAROLINA',
                                    style: textTheme.headlineLarge
                                        ?.copyWith(letterSpacing: 3),
                                  ),
                                  Text(
                                    'CHOCONTÁ',
                                    style: textTheme.headlineLarge
                                        ?.copyWith(letterSpacing: 3),
                                  ),
                                  SizedBox(height: 35), 
                                  Row(
                                    children: [
                                      Icon(Icons.work_outline,
                                          color: primaryGreen, size: 30),
                                      SizedBox(width: 15),
                                      Text('Nutricionista', style: textTheme.bodyLarge),
                                    ],
                                  ),
                                  SizedBox(height: 12), 
                                  Row(
                                    children: [
                                      SizedBox(width: 15),
                                      Text('32 años de edad',
                                          style: textTheme.bodyLarge),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Experiencia Laboral
                            _buildSectionHeader('EXPERIENCIA LABORAL', textTheme),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30),
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
                                  SizedBox(height: 35), 
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

                            SizedBox(height: 40), 

                            // Educación
                            _buildSectionHeader('EDUCACIÓN', textTheme),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30),
                                  _buildEducationEntry(
                                    '2010 - 2015',
                                    'LICENCIATURA EN NUTRICIÓN',
                                    'Universidad La Sierra',
                                    textTheme,
                                  ),
                                  SizedBox(height: 35),
                                  _buildEducationEntry(
                                    '2004 - 2009',
                                    'NIVEL SECUNDARIO',
                                    'Colegio Verde Bendito',
                                    textTheme,
                                  ),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Aquí podrías agregar un pequeño espacio al final si fuera necesario
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Métodos auxiliares (sin cambios en la lógica de tamaño o estilo)

  Widget _buildSectionTitle(String title, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineMedium?.copyWith(
            color: Colors.black, 
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 10), 
      ],
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
            padding: const EdgeInsets.only(bottom: 12.0), 
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0), 
                  child: Icon(Icons.circle, size: 8, color: primaryGreen), 
                ),
                SizedBox(width: 15), 
                Expanded(child: Text(skill, style: textTheme.bodyMedium)), 
              ],
            ),
          ),
        )
        .toList();
  }

  Widget _buildContactInfo(IconData icon, String text, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryGreen, size: 26), 
          SizedBox(width: 15), 
          Expanded(child: Text(text, style: textTheme.bodyMedium)), 
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      color: primaryGreen,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0), 
      child: Text(
        title,
        style: textTheme.titleLarge?.copyWith( 
          color: Colors.white,
          letterSpacing: 2,
        ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140, 
          child: Text(
            period,
            style: textTheme.bodySmall?.copyWith( 
              color: primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 30), 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.titleMedium), 
              SizedBox(height: 6), 
              Text(
                company,
                style: textTheme.bodyMedium?.copyWith( 
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15), 
              ...responsibilities
                  .map(
                    (resp) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0), 
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0), 
                            child: Icon(Icons.circle, size: 7, color: Colors.black54), 
                          ),
                          SizedBox(width: 15), 
                          Expanded(
                            child: Text(
                              resp,
                              style: textTheme.bodyMedium, 
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140, 
          child: Text(
            period,
            style: textTheme.bodySmall?.copyWith( 
              color: primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 30), 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(degree, style: textTheme.titleMedium), 
              SizedBox(height: 6), 
              Text(
                institution,
                style: textTheme.bodyMedium?.copyWith(color: Colors.black54), 
              ),
            ],
          ),
        ),
      ],
    );
  }
}