import 'package:flutter/material.dart';

void main() {
  runApp(const ComboDemo());
}

class ComboDemo extends StatefulWidget {
  const ComboDemo({super.key});

  @override
  State createState() => _ComboDemoState();
}

class _ComboDemoState extends State {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Animaciones Implícitas Combinadas")),
        body: Center(
            child: Container(
            color: Colors.grey.shade300,
            child: AnimatedAlign(
              duration: Duration(milliseconds: 600),
              alignment: active ? Alignment.centerRight : Alignment.centerLeft,
              child:AnimatedOpacity( duration: Duration(milliseconds: 600), opacity: active ? 1 : 0.3,   child:  AnimatedContainer(duration: Duration(milliseconds: 600),curve: Curves.easeInOut,width: active ? 200 : 100, height:  active ? 200 : 100, color: Colors.blue),
            ),
          )
        ),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              active = !active;
            });
          },
        )
      ),

    );
  }
}

