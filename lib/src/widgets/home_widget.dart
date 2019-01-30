import 'package:flutter/material.dart';
import 'package:weather_app/src/widgets/search_delegate.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
