import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final elements = ['Element 1', 'Element 2', 'Element 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components Temp')),
      body: ListView(children: _crearElementsCurt()),
    );
  }

  //List<Widget> _crearElements() {
  //  List<Widget> llista = [];
  //  elements.forEach((element) {
  //    llista.add(ListTile(title: Text(element)));
  //    llista.add(Divider());
  //  });
  //  return llista;
  //}

  List<Widget> _crearElementsCurt() {
    var widgets = elements.map((element) {
      return Column(
        children: [
          ListTile(
            title: Text(element),
            subtitle: Text('Text subtitol'),
            leading: Icon(Icons.star),
            trailing: Icon(Icons.pages),
            onTap: () {
              print('Has tocat l elemnent');
            },
          ),
          Divider(),
        ],
      );
    });

    return widgets.toList();
  }
}
