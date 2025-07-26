import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ThinkForge());
}

class ThinkForge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThinkForge',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
