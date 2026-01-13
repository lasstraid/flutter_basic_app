import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void remove() {
    setState(() {
      counter--;
    });
  }

  void restart() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          'flutter basic app',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white70,
            onPressed: () {
              increment();
            },
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.white70,
            onPressed: () {
              remove();
            },
            heroTag: 'remove',
            child: Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.white70,
            onPressed: () {
              restart();
            },
            heroTag: 'reset',
            child: Icon(Icons.refresh),
          ),
          const SizedBox(height: 50),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              child: Text(
                'menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('counter'),
              leading: Icon(Icons.one_k_rounded),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              title: Text('containers'),
              leading: Icon(Icons.square_rounded),
              onTap: () {
                Navigator.of(context).pushNamed('/containers');
              },
            ),
            ListTile(
              title: Text('wannabe wallet'),
              leading: Icon(Icons.money_rounded),
              onTap: () {
                Navigator.of(context).pushNamed('/wannabe-wallet');
              }
            )
          ],
        ),
      ),
    );
  }
}
