import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  const DetailsPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details Page")),
      body: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Center(child: Text("Hey, $name")),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
