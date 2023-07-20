import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MotorControlApp());

class MotorControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MotorControlScreen(),
    );
  }
}

class MotorControlScreen extends StatelessWidget {
  final String esp8266IpAddress = '192.168.137.54';

  void openMotor() async {
    final url = Uri.http(esp8266IpAddress, '/open');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Motor opened successfully');
    } else {
      print('Failed to open the motor');
    }
  }

  void closeMotor() async {
    final url = Uri.http(esp8266IpAddress, '/close');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Motor closed successfully');
    } else {
      print('Failed to close the motor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motor Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: openMotor,
              child: Text('Open Motor'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: closeMotor,
              child: Text('Close Motor'),
            ),
          ],
        ),
      ),
    );
  }
}
