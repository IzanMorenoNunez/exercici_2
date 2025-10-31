import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquejarSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImatge()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Grandària de la imatge',
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: _bloquejarSlider
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquejar Slider'),
      value: _bloquejarSlider,
      onChanged: (valor) {
        setState(() {
          _bloquejarSlider = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquejar Slider'),
      value: _bloquejarSlider,
      onChanged: (valor) {
        setState(() {
          _bloquejarSlider = valor;
        });
      },
    );
  }

  Widget _crearImatge() {
    return Image(
      image: NetworkImage(
        'https://p.kindpng.com/picc/s/176-1766643_come-to-the-dart-side-flutter-custom-bottom.png',
      ),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}