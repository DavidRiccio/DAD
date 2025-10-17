import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personalización con BoxDecoration'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Container(color: Colors.grey[200],
          child: Container(width:500,height: 500, BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),boxShadow: [BoxShadow(color: Colors.black)]),),)

        ),
      ),
    ),
  );
}