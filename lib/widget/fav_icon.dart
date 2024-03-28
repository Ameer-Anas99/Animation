import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? _colorAnimation;
  Animation<double?>? _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller!);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 60), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 60, end: 40), weight: 50)
    ]).animate(_controller!);

    // _controller!.forward();
    _controller!.addListener(() {
      print(_controller!.value);
      print(_colorAnimation!.value);
    });
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, _) {
        return IconButton(
          onPressed: () {
            isFav ? _controller!.reverse() : _controller!.forward();
          },
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation!.value,
            size: _sizeAnimation!.value,
          ),
        );
      },
    );
  }
}
