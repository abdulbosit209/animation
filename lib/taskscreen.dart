import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      border: Border.all(color: Colors.yellow.withOpacity(0.2), width: 2),
      color: Colors.green,
      boxShadow:  [BoxShadow(
        blurRadius: 0,
        spreadRadius: 0,
        offset: const Offset(0, 0),
        color: Colors.grey.withOpacity(0)
      )],

    ),
    end: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: Colors.red.withOpacity(0.2), width: 2),
      color: Colors.blue,
      boxShadow:  [BoxShadow(
          blurRadius: 5,
          spreadRadius: 5,
          offset: const Offset(1, 5),
          color: Colors.grey.withOpacity(0.8)
      )],
    ),
  );

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Decoration Transition"),),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_controller),
          child: Container(
            width: 200,
            height: 300,
            padding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
