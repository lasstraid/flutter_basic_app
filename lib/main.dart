import 'package:flutter/material.dart';
import 'package:flutter_basic_app/pages/home.dart';
import 'package:flutter_basic_app/pages/containers.dart';
import 'package:flutter_basic_app/pages/wallet.dart';

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
      routes: {
        '/': (BuildContext context) {
          return const CounterPage();
        },
        '/containers': (BuildContext context) {
          return const ContainersPage();
        },
        '/wannabe-wallet': (BuildContext context) {
          return const WalletPage();
        }
      },
    );
  }
}