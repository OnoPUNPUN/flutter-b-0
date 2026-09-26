// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: TextTheme(
//           headlineMedium: TextStyle(fontSize: 32, fontWeight: .bold),
//         ),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
//         scaffoldBackgroundColor: Colors.grey,
//         appBarTheme: AppBarTheme(
//           centerTitle: false,
//           backgroundColor: Colors.amber,
//         ),
//       ),

//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//       title: "Theme",
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("My App")),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 "Click Me",
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ),

//             const SizedBox(height: 10),
//             Text("REgister", style: TextStyle(fontSize: 22)),
//           ],
//         ),
//       ),
//     );
//   }
// }
