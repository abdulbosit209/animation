import 'package:animation/second_page.dart';
import 'package:animation/sixth_page.dart';
import 'package:animation/taskscreen.dart';
import 'package:animation/third_page.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';
import 'fiveth_page/five_page.dart';
import 'forth_page/forth_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  SixthPage(),
    );
  }
}
