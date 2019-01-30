import 'package:flutter/material.dart';
import 'package:weather_app/src/api/api.dart';
import 'package:weather_app/src/bloc/weather_bloc.dart';
import 'package:weather_app/src/models/location_model.dart';
import 'package:weather_app/src/models/weather_model.dart';

class Search extends SearchDelegate<WeatherModel> {
  final WeatherBloc weatherBloc;
  final List<WeatherModel> weatherList;
  final api = ApiProvider();

  Search({this.weatherBloc, this.weatherList});

  @override
  List<Widget> buildActions(BuildContext context) {
    //This widget allows you to se a clear IconButton
    //that on click will delete all data into query variable
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //This widget allows you to se a arrow back IconButton
    //that on click will navigate to the Home widget thanks to the context
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //This method allow you to see on the screen a widget
    //that contains the results of your search
    if (!(query.isEmpty || query == null)) {
      return buildTile(weatherBloc, query);
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //This method allow you to see on the screen a widget
    //that contains all the avaliable suggestions for what are you searching for

    if (!(query.isEmpty || query == null)) {
      return buildTile(weatherBloc, query);
    } else {
      return Container();
    }
  }

  buildTile(WeatherBloc bloc, String query) {
    return FutureBuilder(
      future: api.fetchLocationData(query),
      builder: (context, AsyncSnapshot<LocationModel> snapshotLocation) {
        if (!snapshotLocation.hasData) {
          return ListTile(
            title: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (!(snapshotLocation.data.status == "OK")) {
          return ListTile(
            title: Center(
              child: Text('NO DATA!'),
            ),
          );
        }

        return FutureBuilder(
          future: api.fetchWeatherData(
              snapshotLocation.data.results[0].geometry.location.lat,
              snapshotLocation.data.results[0].geometry.location.lng),
          builder: (context, AsyncSnapshot<WeatherModel> snapshotWeather) {
            if (!snapshotWeather.hasData) {
              return ListTile(
                title: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (!(snapshotWeather.data.cod == "200")) {
              return ListTile(
                title: Center(
                  child: Text('NO DATA!'),
                ),
              );
            }

            return ListTile(
              title: Text(snapshotLocation.data.results[0].formattedAddress),
              onTap: () {
                weatherList.add(snapshotWeather.data);
                bloc.addListOfWeatherModel(weatherList);
                close(context, null);
              },
            );
          },
        );
      },
    );
  }
}
