import 'package:flutter/material.dart';
import 'package:smart_waste_management/dashboard.dart';
import 'package:smart_waste_management/dustbinDetailPage.dart';
import 'package:smart_waste_management/trashbinPage.dart';
import 'package:smart_waste_management/dashboard.dart';

Color darkBlueColor = Color(0xFF000080);

class landingpage extends StatelessWidget {
  const landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: darkBlueColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Image.asset(
                  'assets/brandlogo.png',
                  height: 50,
                  width: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'TrashTrack',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                      color: darkBlueColor),
                ),
                const SizedBox(
                  height: 50,
                ),
                motto_text(
                  ('"Revolutionize waste management'),
                ),
                motto_text(
                  ("with smart dustbin for"),
                ),
                motto_text(
                  ('cleaner city"'),
                ),
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: darkBlueColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardApp(),
                      ),
                    );
                  },
                  // onPressed: DashboardApp,
                  child: const Text("Get Started"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Text motto_text(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: Color.fromARGB(255, 2, 97, 5),
      ),
    );
  }
}
