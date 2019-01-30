import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/weather_bloc.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/widgets/search_delegate.dart';

class Home extends StatelessWidget {
  final List<WeatherModel> weatherList;

  Home(this.weatherList);

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
      body: buildList(weatherBloc),
    );
  }

  Widget buildList(WeatherBloc bloc) {
    return StreamBuilder(
      stream: bloc.weatherListStream,
      builder: (context, AsyncSnapshot<List<WeatherModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('NO CITY!'),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
                buildTile(snapshot.data[index]),
                Divider(),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildTile(WeatherModel item) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      title: Text(
        item.name,
        style: TextStyle(fontSize: 22),
      ),
      subtitle: Text(
        'Temperature: ${item.main.temp}',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
