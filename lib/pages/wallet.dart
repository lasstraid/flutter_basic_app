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
      int qty = random.nextInt(100);
      amount = (amount - qty) < 0 ? 0 : amount - qty;
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Hello world!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            iconSize: 36,
            icon: Icon(Icons.person_outline_outlined),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CashBalanceCard(amount: amount, addCash: addCash, cashOut: cashOut),
            const SizedBox(height: 16),
            GridOptions(),
          ],
        ),
      ),
    );
  }
}

class CashBalanceCard extends StatelessWidget {
  final int amount;
  final VoidCallback addCash;
  final VoidCallback cashOut;

  const CashBalanceCard({
    super.key,
    required this.amount,
    required this.addCash,
    required this.cashOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            children: [
              _actionButton('Add Cash', addCash),
              _actionButton('Cash Out', cashOut),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF2F2F2),
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 22),
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class GridOptions extends StatelessWidget {
  const GridOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        InfoCard(
          title: 'Savings',
          amount: '\$0.00',
          subtitle: '1.5% interest',
          icon: Icons.savings,
          iconColor: Colors.green,
        ),
        InfoCard(
          title: 'Borrow',
          amount: '\$36.03',
          subtitle: 'Available',
          icon: Icons.arrow_forward,
          iconColor: Colors.blue,
        ),
        InfoCard(
          title: 'Bitcoin',
          amount: '\$999.99',
          subtitle: '5.5% today',
          icon: Icons.currency_bitcoin,
          iconColor: Colors.orange,
        ),
        InfoCard(
          title: 'Stocks',
          amount: '\$0.00',
          subtitle: '0.00% today',
          icon: Icons.show_chart,
          iconColor: Colors.purple,
        ),
        InfoCard(
          title: 'Borrow',
          amount: '\$36.03',
          subtitle: 'Available',
          icon: Icons.arrow_forward,
          iconColor: Colors.blue,
        ),
        InfoCard(
          title: 'Borrow',
          amount: '\$36.03',
          subtitle: 'Available',
          icon: Icons.arrow_forward,
          iconColor: Colors.blue,
        ),
        InfoCard(
          title: 'Borrow',
          amount: '\$36.03',
          subtitle: 'Available',
          icon: Icons.arrow_forward,
          iconColor: Colors.blue,
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String amount;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withValues(alpha: 0.2),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          if (amount.isNotEmpty)
            Text(
              amount,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 10,),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
