import 'package:flutter/material.dart';

import 'landingpage.dart';

void main() {
  runApp(Smartdustbin());
}

class Smartdustbin extends StatelessWidget {
  const Smartdustbin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: landingpage(),
    );
  }
}