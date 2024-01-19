import 'package:flutter/material.dart';
import 'package:project1/firstScreen.dart';

class Sliders extends StatefulWidget{
  @override
  State<Sliders> createState() => _SliderState();
}

class _SliderState extends State<Sliders> {
  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical:100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(_currentValue.toString(),style: TextStyle(fontSize: 40)),
              Slider(
                value: _currentValue.toDouble(),
                min: 0,
                max: 100,
                label: _currentValue.toString(),
                activeColor: Colors.lightGreenAccent,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>FirstScreen(),));
              }, child: Text('Screen')),
            ],
          ),
        )
      );
  }
}



