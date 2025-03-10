import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    connectAndListen();
  }

  void connectAndListen() {
    print('call func');
    socket = IO.io(
      'http://192.168.100.180:3484',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      print('connect');
      socket.emit('fromClient', 'test from client');
    });

    //When an event recieved from server, data is added to the stream
    socket.onDisconnect((_) => print('disconect'));
  }

  void _incrementCounter() {
    //Bước 1: truyền biến counter lên server
    socket.emit('fromClient', _counter);
    //Bước 3: lắng nghe sự kiện từ server
    socket.on('fromServer', (data) {
      setState(() {
        _counter = int.parse(data);
      });
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Nhấn vào nút dấu cộng bạn sẽ thấy nó nhảy số:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
