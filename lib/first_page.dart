import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    animationController1 = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController2 = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: pi * 2).animate(animationController1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController1.forward();
        }
      });
    animationController1.forward();

    animation2 =
    Tween<double>(begin: 0, end: pi * 2).animate(animationController2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          const Duration(seconds: 2);
          animationController2.forward();
        }
      });
    animationController2.forward();
  }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: animation.value,
                child:  Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)
                  ),

                  height: 200,
                  width: 120,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: animation2.value,
                child:  Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)
                  ),

                  height: 200,
                  width: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}