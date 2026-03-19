import 'package:flutter/material.dart';
import 'package:untitled/login.dart';

class MenuSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuSheetState();
  }
}

class _MenuSheetState extends State<MenuSheet> {
  String title = 'Default Title';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PopupMenuButton<String>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Option1'),
                      value: 'Option1',
                    ),
                    PopupMenuItem(
                      child: Text('Option2'),
                      value: 'Option2',
                    ),
                    PopupMenuItem(
                      child: Text('Option3'),
                      value: 'Option3',
                    ),
                  ],
                  onSelected: (String newValue) {
                    setState(() {
                      title = newValue;
                    });
                  },
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Show Modal Bottom Sheet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
