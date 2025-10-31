import 'dart:async';
import 'package:flutter/material.dart';

class LlistaPage extends StatefulWidget {
  @override
  _LlistaPageState createState() => _LlistaPageState();
}

class _LlistaPageState extends State<LlistaPage> {
  List<int> _llistaNombres = [];
  int _darrerItem = 0;
  bool _estaCarregant = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _carregaNou();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Llistes'),
      ),
      body: Stack(
        children: [
          _crearLlista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLlista() {
    return RefreshIndicator(
      onRefresh: obtenirPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _llistaNombres.length,
        itemBuilder: (BuildContext context, int index) {
          final imatge = _llistaNombres[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$imatge/500/400'),
            height: 300.0,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _crearLoading() {
    if (_estaCarregant) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }

  void _carregaNou() {
    for (int i = 0; i < 5; i++) {
      _llistaNombres.add(_darrerItem++);
    }
    setState(() {});
  }

  Future<Timer> fetchData() async {
    _estaCarregant = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return Timer(duration, peticioHTTP);
  }

  void peticioHTTP() {
    _estaCarregant = false;
    _carregaNou();

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> obtenirPagina() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _llistaNombres.clear();
      _darrerItem++;
      _carregaNou();
    });
    return Future.delayed(duration);
  }
}