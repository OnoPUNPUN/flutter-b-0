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
//   ThemeMode themeMode =
//       ThemeMode.light; // I've to change this value to opposite value

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: themeMode,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Theme Mode"),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   themeMode = themeMode == ThemeMode.light
//                       ? ThemeMode.dark
//                       : ThemeMode.light;

//                   /*
//                       if (themeMode == ThemeMode.light) {
//                     themeMode = ThemeMode.dark;
//                     } else {
//                     themeMode = ThemeMode.light;
//                   }
//                        */
//                 });
//               },
//               icon: Icon(Icons.dark_mode),
//             ),
//           ],
//         ),
//         body: Center(
//           child: Text(
//             "Hello Flutter",
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//         ),
//       ),
//     );
//   }
// }
