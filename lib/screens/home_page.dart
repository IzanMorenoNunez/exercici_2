import 'package:exercici_2/providers/menu_providers.dart';
import 'package:exercici_2/utils/icono_string_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components')),
      body: _llista(),
    );
  }
}
Widget _llista() {
  // menuProvider.CarregarDades()
  return FutureBuilder(
    future: menuProvider.CarregarDades(),
    initialData: [], // Aquest seria el valor per defecte que s'envia a snapshot.data
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
      print('builder');
      print(snapshot.data);
      return ListView(
        children: _llistaElements(snapshot.data),
      );
    },
  );
}

List<Widget> _llistaElements( List<dynamic>? data ) {
  final List<Widget> elements =[];
  data?.forEach((element) {
    final widgetTemp = ListTile(
      title: Text(element['texte']),
      leading: getIcon(element['icona']),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      onTap: (){},
    );
    elements..add(widgetTemp)
            ..add(Divider());
  });
  return  elements;
}

