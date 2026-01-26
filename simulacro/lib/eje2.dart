import 'package:flutter/material.dart';

void main() {
  runApp(const EmojiApp());
}

class EmojiApp extends StatelessWidget {
  const EmojiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Emojipage(),
    );
  }
}

class Emojipage extends StatefulWidget {
  const Emojipage({super.key});

  @override
  State<Emojipage> createState() => _EmojipageState();
}

class _EmojipageState extends State<Emojipage> {
 double scale = 2.5;

 void changeSCale() {
   setState(() {
     scale = scale==1.5 ? 2.5 : 1.5;
   });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Semáforo estático'), centerTitle: true),
      floatingActionButton: FloatingActionButton(onPressed: (){changeSCale();},child: Icon(Icons.play_arrow),),
      body: Center(
        child: AnimatedScale(scale: scale, duration: Duration(milliseconds: 400),curve: Curves.easeInOut,child: Text("😄",style: TextStyle(fontSize: 100),),)
      ),
    );
  }
}

