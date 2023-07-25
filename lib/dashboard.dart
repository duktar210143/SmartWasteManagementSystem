import 'package:flutter/material.dart';
import 'package:smart_waste_management/aboutUs.dart';
import 'package:smart_waste_management/dustbinDetailPage.dart';
import 'package:smart_waste_management/dustbinpageB.dart';
import 'package:smart_waste_management/landingpage.dart';

Color darkBlueColor = Colors.green;

class DashboardApp extends StatelessWidget {
  DashboardApp({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash track',
      debugShowCheckedModeBanner: false,
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
        backgroundColor: Color.fromARGB(255, 4, 58, 106),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'Trash Track',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blackbackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            DashboardItem(
              title: 'Dustbin 1',
              icon: Icons.delete,
              imageAsset: 'assets/Red_dustbin.png',
              onTap: () {
                // Navigate to the existing page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => dustbinDetailPage()));
              },
            ),
            DashboardItem(
              title: 'Dustbin 2',
              icon: Icons.delete,
              imageAsset: 'assets/green_dustbin.png',
              onTap: () {
                // Navigate to the existing page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dustbinpageB()));
              },
            ),
            DashboardItem(
              title: 'Dustbin 3',
              icon: Icons.delete,
              imageAsset: 'assets/blue_dustbin.png',
              onTap: () {
                // Navigate to the existing page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => dustbinDetailPage()));
              },
            ),
            DashboardItem(
              title: 'Dustbin 4',
              icon: Icons.delete,
              imageAsset: 'assets/yellow_dustbin.png',
              onTap: () {
                // Navigate to the existing page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => dustbinDetailPage()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white, // Set the color for the selected item
        unselectedItemColor: Colors.white.withOpacity(0.6), // Set the color for unselected items with opacity
        backgroundColor:  Color.fromARGB(255, 4, 58, 106).withOpacity(0.2) ,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // navigate to another page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => aboutUS(),
              ),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => landingpage(),
              ),
            );
          }
        },
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
        color: Color.fromARGB(255, 2, 70, 102)
            .withOpacity(0.5), // Set the background color to sky blue
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageAsset,
              width: 48.0,
              height: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
