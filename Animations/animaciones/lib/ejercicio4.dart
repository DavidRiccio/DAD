import 'package:flutter/material.dart';

void main() {
  runApp(const PaddingDemo());
}

class PaddingDemo extends StatefulWidget {
  const PaddingDemo({super.key});

  @override
  State createState() => _PaddingDemoState();
}

class _PaddingDemoState extends State {
  double pad = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Implicit Animation: AnimatedPadding")),
        body: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: AnimatedPadding(
              // dd
              duration: Duration(milliseconds: 500), // dd
              padding: EdgeInsets.all(pad), //dd
              child: Container(width: 120, height: 120, color: Colors.green),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              pad = 50; // dd
            });
          },
        ),
      ),
    );
  }
}
