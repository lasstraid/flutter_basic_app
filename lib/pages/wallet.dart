import 'dart:math';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() {
    return _WalletPageState();
  }
}

class _WalletPageState extends State<WalletPage> {
  int amount = 0;
  Random random = Random();

  void addCash() {
    setState(() {
      amount += random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info_outline_rounded)),
        ],
      ),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
