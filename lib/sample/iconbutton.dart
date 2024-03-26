// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class IconButtonPage extends StatefulWidget {
//   const IconButtonPage({super.key});

//   @override
//   State<IconButtonPage> createState() => _IconButtonState();
// }

// class _IconButtonState extends State<IconButtonPage> {
//   double targetValue = 80;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.teal,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TweenAnimationBuilder<double>(
//               tween: Tween<double>(begin: 0, end: targetValue),
//               duration: Duration(seconds: 2),
//               builder: (BuildContext context, double size, Widget? child) {
//                 return IconButton(
//                   iconSize: size,
//                   color: Colors.black,
//                   icon: child!,
//                   onPressed: () {
//                     setState(() {
//                       targetValue = targetValue == 80 ? 120 : 230;
//                     });
//                   },
//                 );
//               },
//               child: Icon(Icons.access_alarm_outlined),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
