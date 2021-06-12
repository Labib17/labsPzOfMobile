import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rainbow extends StatefulWidget {

  const Rainbow({
    Key key,
  }) : super(key: key);

  @override
  _RainbowState createState() => _RainbowState();
}

class _RainbowState extends State<Rainbow>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation colorAnimation;
  Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      height: sizeAnimation.value,
      width: sizeAnimation.value,
      color: colorAnimation.value,
    );
  }
}
