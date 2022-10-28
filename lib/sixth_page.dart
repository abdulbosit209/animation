
import 'package:flutter/material.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  @override
  Widget build(BuildContext context) {


    bool toLeft = false;
    bool toRight = false;
    bool toBottom = false;
    bool toTop = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sixth page"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 8,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      height: 60,
                      width: 60,
                      top: toTop ? 10 : 0,
                      bottom: toBottom ? 10 : 0,
                      left: toLeft ? 10 : 0,
                      right: toRight ? 10 : 0,
                        duration: const Duration(seconds: 1), child: Container(

                      color: Colors.blue,
                    ))
                  ],
                ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    right: 170,
                      left: 170,
                      child: ElevatedButton(
                        onPressed: (){
                          toTop = !toTop;
                          setState((){});
                        },
                        child: const Icon(Icons.arrow_upward_sharp),
                      )),
                  Positioned(
                    top: 50,
                      right: 250,
                      left: 90,
                      child: ElevatedButton(
                        onPressed: (){
                          toLeft = !toLeft;
                          setState((){});
                        },
                        child: const Icon(Icons.arrow_back),
                      )),
                  Positioned(
                      top: 50,
                    left: 250,
                      right: 90,
                      child: ElevatedButton(
                        onPressed: (){
                          toRight = !toRight;
                          setState((){});
                        },
                        child: const Icon(Icons.arrow_forward),
                      )),
                  Positioned(
                    top: 100,
                    right: 170,
                    left: 170,
                      child: ElevatedButton(
                        onPressed: (){
                          toBottom = !toBottom;
                          setState((){});
                        },
                        child: const Icon(Icons.arrow_downward_sharp),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
