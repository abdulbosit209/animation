


import 'dart:math';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(animationController);
    animation.addListener(() {
      setState((){});
    });

    animationController.repeat();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("second page"),
      ),
      body: Center(
        child: Transform.rotate(
            angle: animation.value,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue
          ),
        ),
      ),
    );
  }
}
