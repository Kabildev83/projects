import 'package:flutter/material.dart';
class MovingImageWidget extends StatefulWidget {
  @override
  _MovingImageWidgetState createState() => _MovingImageWidgetState();
}

class _MovingImageWidgetState extends State<MovingImageWidget> {
  double _right = 0.0; // Initial position

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _right = 100.0; // Updated position after 1 second
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Image Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_right, 0.0, 0.0),
          child: Image.asset('assets/images/login.png'), // Replace with your image path
        ),
      ),
    );
  }
}