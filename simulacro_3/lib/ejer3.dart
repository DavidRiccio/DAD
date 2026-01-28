import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  @override
  MarcadorPageState createState() => MarcadorPageState();
  const MarcadorPage({super.key});
}

class MarcadorPageState extends State<MarcadorPage> {
  int teamA = 0;
  int teamB = 0;

  void addTeamA() {
    setState(() {
    teamA += 1;
      
    });
  }

  void addTeamB() {
    setState(() {
    teamB += 1;
      
    });
  }

  void reiniciar() {
    setState(() {
    teamA = 0;
    teamB = 0;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marcador estático')),
      body: Column(
        children: [
          Text('Equipo A: $teamA'),
          Text('Equipo B: $teamB'),
          SizedBox(height: 18),
          Text(teamA == teamB ? "empate ": teamA > teamB ? "Gana A": "Gana B"),
          SizedBox(height: 18,),
          ElevatedButton(onPressed: (){addTeamA();}, child: Text("Añadir al equipo A")),
          SizedBox(height: 18),
          ElevatedButton(onPressed: (){addTeamB();}, child: Text("Añadir al equipo B")),
          SizedBox(height: 18), 
          ElevatedButton(onPressed: (){reiniciar();}, child: Text("Reiniciar")),

          
        ],
      ),
    );
  }
}
