import 'package:flutter/material.dart';
import 'package:project1/pageRotating.dart';
import 'package:project1/slider.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the main content after a delay
    Future.delayed(
      Duration(seconds: 2), // Change the duration as needed
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit, size: 80,),
              Text('flutter ', style: TextStyle(color: Colors.orange,
                  fontSize: 30),)
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Main Content'),
          actions: [
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 40.0),
                    child:IconButton(
                      onPressed:(){_selectDate(context);},
                    icon: Icon(Icons.calendar_month),
                    ),
                ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 40.0),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                            Sliders()),
                      );
                    },
                    child: Text('GO',style: TextStyle(fontSize: 14,color: Colors.red,backgroundColor: Colors.white),))
            ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  color: Colors.deepOrange,
                    width: 400,
                    height: 200,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Text('Welcome to the first content!',style: TextStyle(color: Colors.yellowAccent,fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PageWithRotationAnimation(),));
                                },
                                child: Text('Animate')),
                          )
                        ],
                      ),
                    )
                ),
                Divider(
                  thickness: 10,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.greenAccent,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      color: Colors.deepOrange,
                      width: 400,
                      height: 200,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Text('Welcome to the second content!',style: TextStyle(color: Colors.yellowAccent,fontSize: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Listen(),));
                                  },
                                  child: Text('ListView')),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                  Divider(),
                  Expanded(
                    flex: 4,
                    child: Container(
                        color: Colors.deepOrange,
                        width: 400,
                        height: 200,
                        child: Center(
                          child: Text('Welcome to the third content!',style: TextStyle(color: Colors.yellowAccent,fontSize: 30),
                          ),
                        )
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Listen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListTile Example'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('John Doe'),
              subtitle: Text('john.doe@example.com'),
              onTap: () {
                // Handle tile tap
                print('Tapped on John Doe');
              },
            ),
            Divider(), // Add a divider between list tiles
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Jane Smith'),
              subtitle: Text('jane.smith@example.com'),
              onTap: () {
               showDialog(context: context,
                   builder:(BuildContext context){
                 return AlertDialog(
                   title: Text('Tapped on Jane Smith'),
                   actions: [
                     TextButton(onPressed: (){
                       Navigator.pop(context);
                 }, child: Text('OK'),
                     ),
                   ],
                 );
                   });
              },
            ),
            // Add more ListTiles as needed
          ],
        ),
      ),
    );
  }
}