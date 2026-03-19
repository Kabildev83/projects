import 'package:flutter/material.dart';

class ScreenDimensionsDisplay extends StatelessWidget {
  final Orientation orientation;

  ScreenDimensionsDisplay({required this.orientation});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Positioned(
            left: 16.0,
            top: 16.0,
            child: Text(
              'Width: ${constraints.maxWidth} ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          Positioned(
            right: 16.0,
            bottom: 16.0,
            child: Text(
              'Height:${constraints.maxHeight} ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),

        ],
      );
    },);
  }
}