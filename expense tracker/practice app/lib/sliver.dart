import 'package:flutter/material.dart';
import 'package:project1/splashscreen.dart';

class Sliver extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       body: CustomScrollView(
         slivers: [
           SliverAppBar(
             leading: Icon(Icons.menu),
             title: Text('My Sliver App'),
             expandedHeight: 300,
             pinned: true,
             flexibleSpace: FlexibleSpaceBar(
               background: Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Colors.brown,Colors.greenAccent],
                     begin: Alignment.topRight,
                     end:Alignment.bottomLeft
                   ),
                 ),
               ),
             ),
         actions: [
          Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 40.0),
          child: ElevatedButton(
          onPressed: (){
         Navigator.push(context,
           MaterialPageRoute(builder: (context)=>
               SplashScreen()),
         );
       },
              child: Text('GO',style: TextStyle(fontSize: 18,color: Colors.green,backgroundColor: Colors.white),))
     ),
    ],
   ),
           SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
             child: Container(
              height: 200,
              color: Colors.deepPurple[300],
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Text('This is the first sliver',style: TextStyle(color:Colors.yellow),)
    ],),
             ),
  ),
),
           ),
           SliverToBoxAdapter(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: ClipRect(
                 //borderRadius: BorderRadius.circular(20),
                 child: Container(
                   height: 400,
                   color: Colors.deepPurple[300],
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('This is the second sliver',style: TextStyle(color:Colors.yellow),)
                     ],
                   ),
                 ),
               ),
             ),
           ),
           SliverToBoxAdapter(
           child: Padding(
             padding:  const EdgeInsets.all(20.0),
             child: ClipOval(
               child: Container(
                 height: 300,
                 color: Colors.deepPurple[300],
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('This is the third sliver',style: TextStyle(color:Colors.yellow,fontSize: 30),)
                   ],
                 ),
               ),
             ),
           ),
           )
         ],
       )

     ),
   );
  }
}