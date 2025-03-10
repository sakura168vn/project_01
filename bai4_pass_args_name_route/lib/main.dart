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
      routes: {DetailScreen.nameRoute: (context) => const DetailScreen()},
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DetailScreen.nameRoute,
                  arguments: ArgumentSceen("title 1", "content 1"),
                );
              },
              child: const Text('Item 1'),
            ),
            const SizedBox(height: 20), // Khoảng cách 20 pixel giữa hai nút
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DetailScreen.nameRoute,
                  arguments: ArgumentSceen("title 2", "content 2"),
                );
              },
              child: const Text('Item 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const nameRoute = '/Detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentSceen;

    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.content)),
    );
  }
}

//Tạo class chứa các tham số để truyền dữ liệu
class ArgumentSceen {
  String title;
  String content;
  ArgumentSceen(this.title, this.content);
}
