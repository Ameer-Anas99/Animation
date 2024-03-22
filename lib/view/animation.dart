import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationState();
}

class _AnimationState extends State<AnimationPage> {
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.teal;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        duration: Duration(seconds: 3),
        color: _color,
        width: _width,
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    _margin = 50;
                  });
                },
                child: Text("Animated")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.pink;
                  });
                },
                child: Text("color"))
          ],
        ),
      ),
    );
  }
}
