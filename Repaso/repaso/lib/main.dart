import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

/// PROVIDER MÁS SIMPLE POSIBLE
class MoodModel extends ChangeNotifier {
  String emoji = '😄';

  void feliz() {
    emoji = '😄';
    notifyListeners();
  }

  void enfadado() {
   emoji =  '😠';
   notifyListeners();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_) => MoodModel(),
      child: const MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MoodModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Provider')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model.emoji, style: const TextStyle(fontSize: 80)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed:(){model.feliz();},
              child: const Text('Feliz'),
            ),

            ElevatedButton(
              onPressed: (){model.enfadado();},
              child: const Text('Enfadado'),
            ),
          ],
        ),
      ),
    );
  }
}