// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Flutter Class"),
//           backgroundColor: Colors.greenAccent,
//           leading: Icon(Icons.search),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             mainAxisAlignment: .center,
//             crossAxisAlignment: .center,
//             children: [
//               Center(
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       backgroundColor: Colors.deepPurple,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {
//                       print("Hello");
//                     }, // To tell What this button will do
//                     child: Text("Follow on Github"),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "Text Button",
//                   style: TextStyle(fontSize: 20, color: Colors.amberAccent),
//                 ),
//               ),
//               SizedBox(height: 10),
//               OutlinedButton(onPressed: () {}, child: Text("Outlined Button")),
//               SizedBox(height: 10),
//               IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
