import 'package:flutter/material.dart';
import 'package:smart_waste_management/dustbinDetailPage.dart';

import 'package:smart_waste_management/dashboard.dart';
import 'package:smart_waste_management/landingpage.dart';


void main() {
  runApp(Smartdustbin());
}

class Smartdustbin extends StatelessWidget {
  const Smartdustbin({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: landingpage(),
    );
  }
}