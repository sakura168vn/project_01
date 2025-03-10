import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {StationDetail.nameRoute: (context) => const StationDetail()},
      title: 'Display list by GridView',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // tạo mảng chứa thông tin của từng item
  List<Station> stations = [
    Station(1, 'Tram 01', 'public', true, 20.1),
    Station(2, 'Tram 02', 'private', false, 20.2),
    Station(3, 'Tram 03', 'public', true, 20.3),
    Station(4, 'Tram 04', 'public', true, 20.4),
    Station(5, 'Tram 05', 'private', false, 20.5),
    Station(6, 'Tram 06', 'public', true, 20.6),
    Station(7, 'Tram 07', 'public', true, 20.7),
    Station(8, 'Tram 08', 'private', false, 20.8),
    Station(9, 'Tram 09', 'public', true, 20.9),
    Station(10, 'Tram 10', 'public', true, 20.10),
    Station(11, 'Tram 11', 'private', false, 20.11),
    Station(12, 'Tram 12', 'public', true, 20.12),
    Station(13, 'Tram 13', 'public', true, 20.13),
    Station(14, 'Tram 14', 'private', false, 20.14),
    Station(15, 'Tram 15', 'public', true, 20.15),
    Station(16, 'Tram 16', 'public', true, 20.16),
    Station(17, 'Tram 17', 'private', false, 20.17),
    Station(18, 'Tram 18', 'public', true, 20.18),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GridView.count(
        childAspectRatio: 1.5,
        crossAxisCount: 4,
        children:
            stations.map((item) {
              return StationItem(item: item);
            }).toList(),
      ),
    );
  }
}

class StationItem extends StatelessWidget {
  const StationItem({super.key, required this.item});

  final Station item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, StationDetail.nameRoute, arguments: item);
      },
      //hiệu ứng click vào sẽ đổi màu
      splashColor: Colors.red,
      child: Card(
        child: Container(
          color: item.status ? Colors.green : Colors.black12,
          alignment: Alignment.center,
          child: Text(
            item.name,
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class StationDetail extends StatelessWidget {
  const StationDetail({super.key});

  static const nameRoute = '/Detail';

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Station;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: item.status ? Colors.green : Colors.black12,
        title: Text(item.name),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item.temp} ',
              style: TextStyle(color: Colors.red, fontSize: 60),
            ),
            Text('o', style: TextStyle(color: Colors.red, fontSize: 30)),
            Text('C', style: TextStyle(color: Colors.red, fontSize: 60)),
          ],
        ),
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
  double temp;
  Station(this.id, this.name, this.type, this.status, this.temp);
}
