## 1. Estructura Principal (lib/main.dart)
Definí toda la maquetación principal en lib/main.dart, dentro del widget ResumeScreen.

Página (Hoja): Usé un Container con un ancho y alto fijos (width: 900.0, height: 1273.0) para simular la proporción de una hoja A4.

División en Columnas: El widget principal dentro de la hoja es un Row. Dividí la pantalla en dos columnas usando el widget Expanded:

Usé Expanded(flex: 2, ...) para la columna izquierda (ocupa 2/5 del ancho).

Usé Expanded(flex: 3, ...) para la columna derecha (ocupa 3/5 del ancho).

Alineación de Columnas: Usé crossAxisAlignment: CrossAxisAlignment.stretch en el Row para asegurar que ambas columnas tuvieran la misma altura y llegaran hasta el final.

## 2. Columna Izquierda (Sidebar)
Esta columna la hice con un Container blanco al que le apliqué un padding. Su hijo es una Column que organiza todo verticalmente:

La Imagen: Usé tu widget personalizado HalfCircleAvatar.

Títulos (Ej. "SOBRE MÍ"): Creé y usé una función local llamada _buildSectionTitle(...).

Texto de Habilidades: Usé la función local _buildSkillList(...), que crea una lista de Rows (filas) para los puntos de habilidad.

Barra de Idioma: La implementé con un Container gris de fondo, y un FractionallySizedBox verde encima para controlar el porcentaje de llenado (el 75%).

Información de Contacto: Usé la función _buildContactInfo(...), que crea una Row por cada ítem (teléfono, email, etc.).

Alineación: Coloqué un Spacer() al final de la Column para empujar todo el contenido de esta columna hacia arriba.

## 3. Columna Derecha (Contenido Principal)
Esta columna la hice más compleja. Usé un Stack para poder dibujar la línea verde continua detrás del resto del contenido.

Capa 1 (Fondo): Un Container con el color de fondo lightGreenBg.

Capa 2 (Línea): Un Positioned que contiene un Container (este es solo la línea verde de 2.0 píxeles de ancho).

Capa 3 (Contenido): Usé un SingleChildScrollView para que todo el contenido pudiera desplazarse. Dentro de este puse una Column que contiene el nombre, la profesión, los títulos y las listas de experiencia.

## 4. Tus Widgets Personalizados (Los archivos que creaste)
Utilicé los tres widgets/clases personalizadas que creaste, que fueron clave para el diseño:

HalfCircleAvatar (lib/widgets/half_circle_avatar.dart): Este fue el widget que usé para tu imagen de perfil. Es un Stack que combina la imagen (Image.asset) dentro de un ClipOval con un CustomPaint para el borde.

HalfCircleBorderPainter (lib/painters/half_circle_body_painter.dart): Este es el "pintor" que usa HalfCircleAvatar. Lo modifiqué para que dibujara el arco verde con bordes rectos (usando StrokeCap.butt).

ExperienceTimeline (lib/widgets/experience_timeline.dart): Usé este widget dos veces: una para "Experiencia Laboral" y otra para "Educación". Recibe la lista de ExperienceItem y los muestra en una Column. Cada ítem es un Row que separa la fecha vertical (para la cual usé un RotatedBox) del contenido (título y descripción).

## 5. Títulos (Ambas Columnas)
Para los títulos, usé dos funciones locales diferentes:

Títulos de la Izquierda ("SOBRE MÍ", "HABILIDADES", "CONTACTO"):

Usé la función local _buildSectionTitle(...) en lib/main.dart.

Esta función devuelve un Container con un Text dentro, usando el estilo headlineMedium que definí en el tema.

Títulos de la Derecha ("EXPERIENCIA LABORAL", "EDUCACIÓN"):

Usé la función local _buildSectionHeader(...) en lib/main.dart.

Esta función devuelve un Container con el fondo verde (primaryGreen) y un Text centrado, usando el estilo titleLarge del tema.

## 6. Uso del Tema (Theme.of(context))
Sí, usé el tema de forma centralizada.

En lib/main.dart, dentro del MaterialApp, definí un ThemeData global. La parte más importante fue el textTheme.

Ahí fue donde definí todos los estilos de fuente usando GoogleFonts.montserrat (como headlineLarge para tu nombre, headlineMedium para los títulos de la izquierda, bodyMedium para el texto normal, etc.).

Luego, en ResumeScreen, obtuve acceso a esos estilos usando final textTheme = Theme.of(context).textTheme;. Pasé esta variable textTheme a todas las funciones (_buildSectionTitle, _buildContactInfo, etc.) y la usé en los Text widgets (ej. Text('CAROLINA', style: textTheme.headlineLarge)).

Hice esto porque es una excelente práctica: nos permitió cambiar todas las fuentes de la aplicación (y su tamaño o grosor) modificando solo un lugar.