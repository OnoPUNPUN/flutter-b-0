import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameTEController = TextEditingController();
  int counter = 0;

  @override
  void initState() {
    super.initState();
    //loadData()
    print("initState Called");
  }

  @override
  Widget build(BuildContext context) {
    print("build Called");
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      body: Center(child: Text('$counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose called");
    _nameTEController.dispose();
  }
}
