import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'App Counter', home: myHomePage());
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  int _counter = 0;
  void countUp() {
    setState(() {
      _counter++;
    });
  }

  void countDown() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow, title: const Text("Home")),
      body: Center(
        child: Column(
          children: [
            const Text("Counter value: "),
            Text(
              '$_counter',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(onPressed: countUp, child: Icon(Icons.add)),
            FloatingActionButton(
              onPressed: countDown,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
