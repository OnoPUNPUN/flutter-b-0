import 'package:class_13/pages/home_page.dart';
import 'package:class_13/pages/profile_page.dart';
import 'package:class_13/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // 0 -> 1

  final List<Widget> screens = const [HomePage(), SearchPage(), ProfilePage()];
  final List<String> titles = const ["Home", "Search", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[_currentIndex])),
      body: screens[_currentIndex], // 0 -> 1
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"), // 0
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ), // 1
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Tonmoy",
          ), // 2
        ],
      ),
    );
  }
}
