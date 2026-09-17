import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Class_One",
      home: Scaffold(
        body: Center(
          child: Text(
            "Hello World!!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: .bold,
              color: Colors.deepOrange,
              letterSpacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}
