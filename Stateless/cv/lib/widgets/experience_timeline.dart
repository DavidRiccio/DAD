import 'package:cv/colors.dart';
import 'package:flutter/material.dart';

class ExperienceItem {
  final String years;
  final String title;
  final String description;

  ExperienceItem({
    required this.years,
    required this.title,
    required this.description,
  });
}

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceItem> experiences;

  const ExperienceTimeline({Key? key, required this.experiences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(experiences.length, (index) {
        final exp = experiences[index];
        final bool isLast = index == experiences.length - 1;

        // Cada item es un Row
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30, // Ancho para el texto vertical
              padding: const EdgeInsets.only(top: 5.0),
              alignment: Alignment.topCenter,
              child: RotatedBox(
                quarterTurns: -1, // Gira el texto
                child: Text(
                  exp.years,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            // --- 2. ESPACIADO ---
            const SizedBox(width: 22),

            // --- 3. CONTENIDO (Título, Descripción, Separador) ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Espacio superior para alinear
                  const SizedBox(height: 2.0),

                  // Título
                  Text(
                    exp.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Descripción
                  Text(
                    exp.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // --- MODIFICADO ---
                  // Separador (si no es el último)
                  if (!isLast)
                    Padding(
                      // Timeline más separada
                      padding: const EdgeInsets.symmetric(vertical: 32.0), // Era 24.0
                      child: Container(
                        width: 60,
                        height: 2,
                        color: primaryGreen,
                      ),
                    )
                  else
                    // Espacio final
                    const SizedBox(height: 32.0), // Era 24.0
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}