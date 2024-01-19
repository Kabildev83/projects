import 'package:flutter/material.dart';
import 'package:project1/fadein.dart';
import 'package:project1/pageRotating.dart';
import 'package:project1/splashscreen.dart';
import 'package:project1/sliver.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Sliver(),
    );
  }
}

