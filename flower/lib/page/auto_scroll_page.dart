import 'package:flutter/material.dart';

class ScrollablePage extends StatefulWidget {
  @override
  _ScrollablePageState createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Page'),
      ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          setState(() {
            _scrollOffset += notification.scrollDelta!;
            if (_scrollOffset < -MediaQuery.of(context).size.height) {
              _scrollOffset = -MediaQuery.of(context).size.height;
            }
          });
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 2,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.red,
                ),
                Transform.translate(
                  offset: Offset(0, _scrollOffset),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.blue,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, _scrollOffset),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.green,
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
