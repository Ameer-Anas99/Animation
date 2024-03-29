// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class SampleAnimation extends StatefulWidget {
//   const SampleAnimation({super.key});

//   @override
//   State<SampleAnimation> createState() => _AnimationState();
// }

// class _AnimationState extends State<SampleAnimation> {
//   double _margin = 0;
//   double _width = 200;
//   Color _color = Colors.teal;
//   double _opacity = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: AnimatedContainer(
//         margin: EdgeInsets.all(_margin),
//         duration: Duration(seconds: 3),
//         color: _color,
//         width: _width,
//         child: Column(
//           children: [
//             TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _margin = 50;
//                     _color = Colors.pink;
//                   });
//                 },
//                 child: Text("Animated")),
//             AnimatedOpacity(
//               duration: Duration(seconds: 5),
//               opacity: _opacity,
//               child: Container(
//                 height: 150,
//                 width: 150,
//                 color: Colors.green,
//                 child: Column(
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _opacity = 0;
//                           });
//                         },
//                         child: Text("add"))
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
