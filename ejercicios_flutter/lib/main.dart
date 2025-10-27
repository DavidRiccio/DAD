import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget{
  final String title;
  final Icon icon;
  const InfoCard({required this.title, required this.icon, super.key});
  @override
  Widget build(BuildContext context) {
    return  Card(elevation: 4,margin: EdgeInsets.all(5),child: 
    Padding(padding: EdgeInsetsGeometry.all(12),child: 
    Row(mainAxisAlignment:MainAxisAlignment.center ,
    children: 
    [icon,SizedBox(width: 10),
    Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
    ],),),) ;

  }

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primer widget personalizado'),
          centerTitle: true,
        ),
        body: Center(

          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [InfoCard(title: "Informacion util",icon: Icon(Icons.info,color: Colors.blue,)),InfoCard(title: "Ajustes del Sistema",icon:  Icon(Icons.settings,color: Colors.blue,)),InfoCard(title: "Usuario Activo",icon:  Icon(Icons.person,color: Colors.blue,))],))
        ),);
  }
}



void main() => runApp(MyApp());