import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Display list by ListView', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // tạo mảng chứa thông tin của từng item
  List<Station> stations = [
    Station(1, 'Tram 01', 'public', true),
    Station(2, 'Tram 02', 'private', false),
    Station(3, 'Tram 03', 'public', true),
    Station(4, 'Tram 04', 'public', true),
    Station(5, 'Tram 05', 'private', false),
    Station(6, 'Tram 06', 'public', true),
    Station(7, 'Tram 07', 'public', true),
    Station(8, 'Tram 08', 'private', false),
    Station(9, 'Tram 09', 'public', true),
    Station(10, 'Tram 10', 'public', true),
    Station(11, 'Tram 11', 'private', false),
    Station(12, 'Tram 12', 'public', true),
    Station(13, 'Tram 13', 'public', true),
    Station(14, 'Tram 14', 'private', false),
    Station(15, 'Tram 15', 'public', true),
    Station(16, 'Tram 16', 'public', true),
    Station(17, 'Tram 17', 'private', false),
    Station(18, 'Tram 18', 'public', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, Index) {
          final item = stations[Index];
          return ListTile(
            leading: Icon(
              Icons.online_prediction,
              color: item.status ? Colors.blue : Colors.greenAccent,
            ),
            title: Text(item.name, style: TextStyle(color: Colors.orange)),
            trailing: Icon(item.type == 'public' ? Icons.public : Icons.lock),
          );
        },
      ),
    );
  }
}

//tạo class lưu trữ thông tin
class Station {
  int id;
  String name;
  String type;
  bool status;
  Station(this.id, this.name, this.type, this.status);
}
