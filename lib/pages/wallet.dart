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

  void cashOut() {
    setState(() {
      amount -= random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Money',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 36,
            icon: Icon(Icons.person_outline_outlined),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [_cashBalanceCard(amount, addCash)]),
      ),
    );
  }
}

Widget _cashBalanceCard(int amount, Function f) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cash Balance',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Account & routing >',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          '\$$amount',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_actionButton('Add Cash', f), _actionButton('Cash Out', f)],
        ),
      ],
    ),
  );
}

Widget _actionButton(String text, Function f) {
  return ElevatedButton(
    onPressed: () => f,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFF2F2F2),
      foregroundColor: Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      child: Text(text, style: TextStyle(fontSize: 16),),
    ),
  );
}
