import 'package:rxdart/rxdart.dart';
import 'package:weather_app/src/models/weather_model.dart';

class WeatherBloc {
  final _weatherList = PublishSubject<List<WeatherModel>>();

  //Getter for stream

  //Getter for add method

  dispose() {
    _weatherList.close();
  }
}
