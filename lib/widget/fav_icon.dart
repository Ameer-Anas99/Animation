// import 'package:flutter/material.dart';

// class FavButton extends StatefulWidget {
//   const FavButton({super.key});

//   @override
//   State<FavButton> createState() => _FavButtonState();
// }

// class _FavButtonState extends State<FavButton> with SingleTickerProviderStateMixin{
//   late AnimationController _controller;
//   late Animation<Color?> colorAnimation;
//   late Animation<double?> sizeAnimation;
//   bool isFav = false;
// @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(microseconds: 500),
//       vsync: this,);
//       sizeAnimation = TweenSequence(
//         <TweenSequenceItem<double>>[
//         TweenSequenceItem<double>(tween: Tween(begin: 32,end: 50), weight: 50),
//         TweenSequenceItem<double>(tween: Tween(
//           begin: 50,end: 30
//         ), weight: 50)
//       ]).animate(_controller);
//       colorAnimation = ColorTween(begin:  Colors.grey[300],end: Colors.red)
//       .animate(_controller);
//       _controller = addStatusListener(status){
//          if (status == AnimationStatus.completed){
//           setState(() {
//             isFav = true;

//           });
//          }
//          if (status == AnimationStatus.dismissed){
//           setState(() {
//             isFav = false;
//           });
//          }
//       };
//   }
// @override
// void dispose (){
//   _controller.dispose();
//   super.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
//     return  AnimatedBuilder(animation: _controller, builder: (context, child) {
//       return IconButton(onPressed: (){
//         isFav ? _controller.reverse() : _controller.forward();

//       },
//        icon: Icon(Icons.favorite,
//       color: colorAnimation.value,
//       size: sizeAnimation.value ?? 30,));
//     },);

//   }
// }
import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? _colorAnimation;
  bool isFav = false;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller!);
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
          icon: Icon(Icons.favorite),
          color: _colorAnimation!.value,
        );
      },
    );
  }
}
