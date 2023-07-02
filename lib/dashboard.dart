import 'package:flutter/material.dart';
import 'package:smart_waste_management/dustbinDetailPage.dart';

Color darkBlueColor = Color(0xFF000080);

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: darkBlueColor,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
            imageAsset: 'assets/Red_dustbin.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => dustbinDetailPage()));
            },
          ),
          DashboardItem(
            title: 'Dustbin 2',
            icon: Icons.delete,
            imageAsset: 'assets/green_dustbin.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => dustbinDetailPage()));
            },
          ),
          DashboardItem(
            title: 'Dustbin 3',
            icon: Icons.delete,
            imageAsset: 'assets/blue_dustbin.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => dustbinDetailPage()));
            },
          ),
          DashboardItem(
            title: 'Dustbin 4',
            icon: Icons.delete,
            imageAsset: 'assets/yellow_dustbin.png',
            onTap: () {
              // Navigate to the existing page
              Navigator.push(context, MaterialPageRoute(builder: (context) => dustbinDetailPage()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
        color: Colors.lightBlueAccent,  // Set the background color to sky blue
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageAsset,
              width: 48.0,
              height: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}

