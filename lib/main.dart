import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

void main() => runApp(const AnimatedBuilderExampleApp());

class AnimatedBuilderExampleApp extends StatelessWidget {
  const AnimatedBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedBuilderExample(),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample ({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();

}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> 
  with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
 void dispose() {
  _controller.dispose();
  super.dispose();
 }

 @override
  Widget build (BuildContext context) {
    return AnimatedBuilder (
    animation: _controller,
    child: Container(
      width: 200.0,
      height: 200.0,
      color: Colors.green,
      child: const Center(
        child: Text('Wheel!'),
      ),
    ),
    builder: (BuildContext context, Widget? child) {
      return Transform.rotate(
        angle: _controller.value *2.0 * math.pi,
        child: child,
      );
    },
  );
}
}
