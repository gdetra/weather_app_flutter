import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/widgets/home_widget.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  Widget build(BuildContext context) {
    return WeatherProvider(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
