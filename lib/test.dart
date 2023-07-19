import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Motor Control'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _motorState = '';

  Future<void> sendMotorCommand(String command) async {

  final url = Uri.parse('http://192.168.137.96/control?command=$command');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _motorState = command;
        });
      } else {
        setState(() {
          _motorState = 'Eor';
        });
      }
    } catch (e) {
      setState(() {
        _motorState = 'Erro';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Motor State:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _motorState,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => sendMotorCommand('forward'),
              child: Text('Move Forward'),
            ),
            ElevatedButton(
              onPressed: () => sendMotorCommand('backward'),
              child: Text('Move Backward'),
            ),
            ElevatedButton(
              onPressed: () => sendMotorCommand('stop'),
              child: Text('Stop Motor'),
            ),
          ],
        ),
      ),
    );
  }
}