import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Container(),
    );
  }
}
