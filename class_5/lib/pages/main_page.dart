import 'package:class_5/pages/details_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(name: "Tonmoy"),
              ),
            );
          },
          child: Text("Go To Details Screen"),
        ),
      ),
    );
  }
}
