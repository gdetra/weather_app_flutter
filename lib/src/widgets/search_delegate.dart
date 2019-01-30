import 'package:flutter/material.dart';
import 'package:weather_app/src/api/api.dart';
import 'package:weather_app/src/models/weather_model.dart';

class Search extends SearchDelegate<WeatherModel> {
  final api = ApiProvider();
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
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(query),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //This method allow you to see on the screen a widget
    //that contains all the avaliable suggestions for what are you searching for
    if (!(query.isEmpty || query == null)) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(query),
            contentPadding: EdgeInsets.all(8.0),
          ),
          Divider(),
        ],
      );
    } else {
      return Container();
    }
  }
}
