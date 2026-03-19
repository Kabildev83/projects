import 'package:flutter/material.dart';
import 'package:fluttergetx/home.dart';
import 'package:get/get.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    home:Login(),
    getPages:[
      GetPage(name:'/', page:()=>Login()),
      GetPage(name: '/home', page:()=>Home())
    ],
      debugShowCheckedModeBanner: false,
    );
  }
}
