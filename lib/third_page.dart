


import 'dart:math';

import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with TickerProviderStateMixin{

  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation animation1;
  late Animation animation2;

  @override
  void initState() {
    animationController1 = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController2 = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation1 = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController1);
    animation2 = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController2);

    animation1.addListener(() {
      setState((){});
    });

    animation2.addListener(() {
      setState((){});
    });

    animationController1.repeat();
    animationController2.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third page"),
      ),
      body: Stack(
        children: [
          Transform.rotate(
            angle: animation2.value,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
            ),
          ),
          Transform.rotate(
            angle: animation1.value,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
