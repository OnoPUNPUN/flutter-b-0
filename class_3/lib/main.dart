import 'package:flutter/material.dart';

void main() {
  runApp(LikePage());
}

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Like Page")),
        body: Center(
          child: IconButton(
            onPressed: () {
              setState(() {
                isLiked = !isLiked; // not gate
              });
            },
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.grey,
            ),
            iconSize: 60,
          ),
        ),
      ),
    );
  }
}
