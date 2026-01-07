import 'package:flutter/material.dart';

class ContainersPage extends StatelessWidget {
  const ContainersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('containers')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        color: Colors.red,
        child: Card(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Container(
                color: Colors.blue,
                height: 125,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(color: Colors.purpleAccent),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Something to eat'),
                  Text(
                    '- A mf who knows to cock',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
