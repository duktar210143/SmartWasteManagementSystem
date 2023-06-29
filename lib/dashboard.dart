import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          DashboardItem(
            title: 'Dustbin 1',
            icon: Icons.delete,
            imageAsset: 'assets/dustbin1.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExistingPage()));
            },
          ),
          DashboardItem(
            title: 'Dustbin 2',
            icon: Icons.delete,
            imageAsset: 'assets/dustbin2.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExistingPage()));
            },
          ),
          DashboardItem(
            title: 'Dustbin 3',
            icon: Icons.delete,
            imageAsset: 'assets/dustbin3.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExistingPage()));
            },
          ),
          DashboardItem(
            title: 'Dustbin 4',
            icon: Icons.delete,
            imageAsset: 'assets/dustbin4.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExistingPage()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String imageAsset;
  final VoidCallback onTap;

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageAsset,
              width: 48.0,
              height: 100.0,
            ),
            SizedBox(height: 8.0),
            Text(title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}

class ExistingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Existing Page'),
      ),
      body: Center(
        child: Text('This is an existing page.'),
      ),
    );
  }
}
