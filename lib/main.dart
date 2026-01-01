import 'package:flutter/material.dart';
import 'package:flutter_basic_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter basic app',
      debugShowCheckedModeBanner: false,
      home: const CounterPage(),
    );
  }
}