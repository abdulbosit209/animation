

import 'package:flutter/material.dart';

class FivePage extends StatefulWidget {
  const FivePage({Key? key}) : super(key: key);

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation borderRadiusAnimation;
  late Animation sizeAnimation;

  late List <double> numbers = [123.0, 34.0, 543.0, 45.0, 45.0,233.0, 534.0, 455.0, 234.0, 345.0, 123.0 ];
  late int index = 0;

  @override
  void initState() {

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.black).animate(animationController);
    borderRadiusAnimation = Tween<double>(begin: 0.0, end: numbers[index] + 1).animate(animationController);
    sizeAnimation = Tween<double>(begin: 0.0, end: numbers[index] + 1).animate(animationController);

    animationController.addListener(() {
      setState((){});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fifth page"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          decoration: BoxDecoration(
            color: Colors.black,
                borderRadius: BorderRadius.circular(borderRadiusAnimation.value),
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState((){
            index++;
          });
    },
    ),

    );
  }
}
