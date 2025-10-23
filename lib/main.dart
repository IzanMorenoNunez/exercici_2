import 'package:exercici_2/screens/home_page.dart';
import 'package:exercici_2/screens/home_temp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components',
      home: HomePage()
    );
  }
}