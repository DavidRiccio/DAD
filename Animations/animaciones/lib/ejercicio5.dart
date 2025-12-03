import 'package:flutter/material.dart';

void main() {
  runApp(const AlignDemo());
}

class AlignDemo extends StatefulWidget {
  const AlignDemo({super.key});

  @override
  State createState() => _AlignDemoState();
}

class _AlignDemoState extends State {
  Alignment pos = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Implicit Animation: AnimatedAlign")),
        body: Center(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.grey.shade300,
            child: AnimatedAlign(
              duration: Duration(seconds: 1),
              alignment: pos,
              child: Container(width: 50, height: 50, color: Colors.orange),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              pos = Alignment.bottomRight;
            });
          },
        ),
      ),
    );
  }
}
