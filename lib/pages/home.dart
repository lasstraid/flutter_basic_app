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

  void restar() {
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text('$counter', style: TextStyle(fontSize: 60, fontWeight: FontWeight.w400)),
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
              restar();
            },
            heroTag: 'reset',
            child: Icon(Icons.refresh),
          ),
          const SizedBox(height: 50),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'counter', icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: 'f*ck', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'conatiner', icon: Icon(Icons.square))
        ],
      ),
    );
  }
}
