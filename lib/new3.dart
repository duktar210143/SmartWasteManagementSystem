import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String arduinoIP = "192.168.137.104"; // Replace with your Arduino's IP address

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Control App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isOpen = false;

  Future<void> _sendRequest(bool isOpen) async {
    try {
      if (isOpen) {
        await http.get(Uri.http(arduinoIP, "/open"));
        print("Open request sent.");
      } else {
        await http.get(Uri.http(arduinoIP, "/close"));
        print("Close request sent.");
      }
    } catch (e) {
      print("Error sending request: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Motor Control")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isOpen = !_isOpen;
                  _sendRequest(_isOpen);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: _isOpen ? Colors.blue[600] : Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  _isOpen ? "Open" : "Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
