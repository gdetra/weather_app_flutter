import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/widgets/search_delegate.dart';

class Home extends StatelessWidget {
  final List<WeatherModel> weatherList = [];

  Widget build(BuildContext context) {
    final weatherBloc = WeatherProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(
                  weatherList: weatherList,
                  weatherBloc: weatherBloc,
                ),
              );
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
