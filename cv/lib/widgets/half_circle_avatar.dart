import 'package:flutter/material.dart';
import '../colors.dart';
import '../painters/half_circle_body_painter.dart';

class HalfCircleAvatar extends StatelessWidget {
  final String imageUrl; // Ahora puede ser una URL o una ruta de asset
  final double size;
  final double strokeWidth;
  final HalfSide side;

  const HalfCircleAvatar({
    super.key,
    required this.imageUrl,
    this.size = 180,
    this.strokeWidth = 8,
    this.side = HalfSide.left,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Base circular con sombra + imagen
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(
            // --- MODIFICADO ---
            // Comprueba si la ruta es una URL o un asset local
            child: imageUrl.startsWith('http')
                ? Image.network( // Carga desde Internet
                    imageUrl,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: size,
                        height: size,
                        color: Colors.grey[300],
                        child: const Icon(Icons.person, size: 80, color: Colors.white),
                      );
                    },
                  )
                : Image.asset( // Carga desde assets locales
                    imageUrl,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: size,
                        height: size,
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, size: 80, color: Colors.white),
                      );
                    },
                  ),
            // --- FIN DE LA MODIFICACIÓN ---
          ),
        ),

        // Semicírculo en verde
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: HalfCircleBorderPainter(
              color: primaryGreen,
              strokeWidth: strokeWidth,
              side: side,
            ),
          ),
        ),
      ],
    );
  }
}