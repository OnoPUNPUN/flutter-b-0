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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> pageTitles = ["Home", "Profile", "Crouses", "Settings"];

  void goToPage(int index) {
    setState(() {
      _currentIndex = index;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Dashborad")),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.indigo),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.indigo),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tonmoy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "tonmoy@example.com",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                goToPage(0);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text("Profile"),
              onTap: () {
                goToPage(1);
              },
            ),

            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Courses"),
              onTap: () {
                goToPage(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                goToPage(3);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Welcome to ${pageTitles[_currentIndex]}!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
