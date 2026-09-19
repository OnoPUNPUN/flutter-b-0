import 'package:flutter/material.dart';

void main() {
  runApp(MyProfile());
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Card",
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
            ),
            child: Column(
              mainAxisSize: .min,
              children: [
                CircleAvatar(radius: 30, child: Icon(Icons.person, size: 50)),
                SizedBox(height: 16),
                Text(
                  "Tonmoy",
                  style: TextStyle(fontSize: 26, fontWeight: .bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Flutter Developer",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),

                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      "50",
                      style: TextStyle(fontWeight: .bold, fontSize: 20),
                    ),
                    Text("Projects"),
                    Column(
                      children: [
                        Text(
                          "4K",
                          style: TextStyle(fontWeight: .bold, fontSize: 20),
                        ),
                        Text("Followers"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Follow Now")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
