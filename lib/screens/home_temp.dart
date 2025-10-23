import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final elements = ['Element 1', 'Element 2', 'Element 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components Temp')),
      body: ListView(children: _crearElements()),
    );
  }

  List<Widget> _crearElements(){
   //Aquesta declaració és la nova degut al null safety
  List<Widget> llista = [];
  for (String element in elements){
    final tempWidget = ListTile(
      title: Text(element)
    );
    llista.add(tempWidget);
    llista.add(Divider());
  }
  return llista;
}
}