// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: .center,
//             children: [
//               Text('$count', style: TextStyle(fontSize: 20)), // redbuit
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     if (count > 30) {
//                       count = 0;
//                     } else {
//                       count++;
//                     }
//                   });
//                   print(count);
//                 },
//                 child: Text("Increment"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
