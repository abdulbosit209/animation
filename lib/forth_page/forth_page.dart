

import 'package:flutter/material.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({Key? key}) : super(key: key);

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation colorWidthAnimation;
  late Animation borderRadiusAnimation;
  late Animation borderWidthAnimation;



  @override
  void initState() {

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(animationController);
    colorWidthAnimation = ColorTween(begin: Colors.black, end: Colors.red).animate(animationController);
    borderRadiusAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(animationController);
    borderWidthAnimation = Tween<double>(begin: 15.0, end: 0.0).animate(animationController);

    animationController.addListener(() {
      setState((){});
    });

    animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forth screen"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusAnimation.value),
            border: Border.all(color: colorWidthAnimation.value, width: borderWidthAnimation.value),
            color: colorAnimation.value
          ),
        ),
      ),
    );
  }
}
