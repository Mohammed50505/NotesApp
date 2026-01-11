
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homescren.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescren(),
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "APP Bar title",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w300,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // الصف الأول (مربعين جنب بعض)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 90,
//                     width: 90,
//                     color: Colors.blue,
//                     child: const Icon(Icons.cake, color: Colors.white),
//                   ),

//                   Container(
//                     height: 90,
//                     width: 90,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.blue, Colors.deepPurple],
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.email,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),

//               // الصف التاني (دائرة)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.blue,
//                     ),
//                     child: const Text(
//                       "circle",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),

//                   Container(
//                     width: 90,
//                     height: 90,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),

//                     child: Center(
//                       child: Text(
//                         "Mohamed",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.blue,
//                     ),
//                     child: const Text(
//                       "circle",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),

//                   Container(
//                     width: 90,
//                     height: 90,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),

//                     child: Center(
//                       child: Text(
//                         "Mohamed",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],

//           ),
//         ),
//       ),
//     );
//   }
// }
