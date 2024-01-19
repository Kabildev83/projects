import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Hero(
            tag: 'heroTag',
            child: Container(
              child: Center(child: Text('Click Me',style: TextStyle(color: Colors.redAccent,fontSize: 24),)),
              width: 140.0,
              height: 140.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'heroTag',
          child: Container(
            child: Center(child: Text('I am Hero',style: TextStyle(color: Colors.redAccent,fontSize: 24),)),
            width: 300.0,
            height: 300.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

