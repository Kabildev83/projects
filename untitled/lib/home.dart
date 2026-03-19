import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:untitled/login.dart';
import 'package:untitled/charts.dart';
import 'package:untitled/tabledata.dart';
import 'package:untitled/layout.dart';
import 'package:untitled/MenuSheet.dart';

class Home extends StatefulWidget {
  final String email;
  final String password;
  final DateTime loginTime;

  Home({required this.email, required this.password, required this.loginTime});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  int _seconds = 0;
  late Timer _timer;
  bool showUserDetails = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length:7, vsync: this);

    // Start the global timer when the user logs in
    _startGlobalTimer();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel(); // Cancel the timer when the app is disposed
    super.dispose();
  }

  // Start the global timer that counts the session duration
  void _startGlobalTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Bar'),
          actions: [
            Button(
              button_name: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'User Details'),
              Tab(icon: Icon(Icons.ac_unit_rounded), text: 'Login Time'),
              Tab(icon: Icon(Icons.timer), text: 'Session Timer'),
              Tab(icon: Icon(Icons.list), text: 'Charts'),
              Tab(icon: Icon(Icons.table_chart), text: 'Table'),
              Tab(icon:Icon(Icons.layers),text:'LayoutBuilder'),
              Tab(icon: Icon(Icons.border_bottom),text:'Menusheet'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showUserDetails)
                      Column(
                        children: [
                          Text(
                            'Email: ${widget.email}',
                            style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Password: ${widget.password}',
                            style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: true,
                          groupValue: showUserDetails,
                          onChanged: (value) {
                            setState(() {
                              showUserDetails = true;
                            });
                          },
                        ),
                        Text('Show'),
                        Radio(
                          value: false,
                          groupValue: showUserDetails,
                          onChanged: (value) {
                            setState(() {
                              showUserDetails = false;
                            });
                          },
                        ),
                        Text('Hide'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Login Time Tab
            Center(
              child: Text(
                'Login Time: ${DateFormat('MMMM d, yyyy   hh:mm:ss a').format(widget.loginTime)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),

            SessionTimerContent(sessionDuration: _seconds),
            Charts(),
            TableData(),
            ScreenDimensionsDisplay( orientation: MediaQuery.of(context).orientation,),
            MenuSheet(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: const Text(
                  'Login Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('User Details'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.ac_unit_rounded),
                title: Text('Login Time'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.timer),
                title: Text('Session Timer'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SessionTimerContent extends StatelessWidget {
  final int sessionDuration;
  SessionTimerContent({required this.sessionDuration});

  @override
  Widget build(BuildContext context) {
    final Duration duration = Duration(seconds: sessionDuration);
    return Center(
      child: Text(
        'Session Duration: ${duration.inHours}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}