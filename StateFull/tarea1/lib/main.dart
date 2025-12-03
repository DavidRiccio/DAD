import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeNotifier(), child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDark;
    return MaterialApp(
      routes: {
        '/': (_) => const HomePage(),
        '/pantalla2': (_) => const Pantalla2(),
      },
      debugShowCheckedModeBanner: false,
      title: "Tema claro/oscuro",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0455BF),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0455BF),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
  
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDark;
    final toggleTheme = context.read<ThemeNotifier>().toggleTheme;
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: toggleTheme,
                child: Text("Cambiar de modo"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pantalla2');
                },
                child: Text("Ir a pantalla 2"),
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: toggleTheme),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleTheme = context.read<ThemeNotifier>().toggleTheme;
    final isDark = context.watch<ThemeNotifier>().isDark;

    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Center(
        child: ElevatedButton(
          onPressed: toggleTheme,
          child: Text("Cambiar de modo"),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: toggleTheme),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
