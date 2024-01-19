import 'package:flutter/material.dart';
import 'package:project1/rotatingpage.dart';
class PageWithRotationAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotating Animation Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return RotatingPage();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                transitionDuration: Duration(seconds: 3),
              ),
            );
          },
          child: Text('Go to Rotating Page'),
        ),
      ),
    );
  }
}