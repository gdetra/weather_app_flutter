import 'package:http/http.dart' show Client;
import 'package:weather_app/src/models/location_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:weather_app/src/models/weather_model.dart';

class ApiProvider {
  Client client = new Client();
  //Initialization of URLs root.
  final _apiMapsUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?address=';
  final _apiWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather?';

  //Initialization of the Api keys.
  //You can get this keys on Google Maps and Openweathermap.org
  final _apiKeyMaps = '';
  final _apiKeyWeather = '';

  //This method return a Future<WeatherModel> and receive as parameters latitude and longitude
  //It makes a get request to fetch weather data from openweathermap Api
  Future<WeatherModel> fetchWeatherData(double lat, double lon) async {
    var url = '${_apiWeatherUrl}lat=$lat&lon=$lon&appid=$_apiKeyWeather';
    var response = await client.get(url);
    return WeatherModel.fromJson(json.decode(response.body));
  }

  //This method return a Future<LocationModel> and receive as parameter an address or a city name
  //It makes a get request to fetch address data from Google Maps Api
  Future<LocationModel> fetchLocationData(String cityName) async {
    var url = '$_apiMapsUrl${cityName.replaceAll(' ', '%20')}&key=$_apiKeyMaps';
    var response = await client.get(url);
    return LocationModel.fromJson(json.decode(response.body));
  }
}
