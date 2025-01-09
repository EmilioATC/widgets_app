import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = const Color.fromARGB(255, 146, 206, 255);
  double borderRadius = 10.0;
  double marginLeft = 0;
  double marginRight = 0;

  void changeShape(){
    final random = Random();
    setState(() {
      width = random.nextInt(300).toDouble() + 120;
      height = random.nextInt(300).toDouble() + 120;
      marginLeft = random.nextInt(200).toDouble();
      marginRight = random.nextInt(200).toDouble();
      color = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
      borderRadius = random.nextInt(100).toDouble();
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          margin: EdgeInsets.only(left: marginLeft < 0 ? 0 : marginLeft, right: marginRight < 0 ? 0 : marginRight),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius< 0 ? 0 : borderRadius),
          ),
        )
        
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon( Icons.play_arrow_rounded ),
      ),
    );
  }
}