import 'package:rxdart/rxdart.dart';
import 'package:weather_app/src/models/weather_model.dart';

class WeatherBloc {
  final _weatherList = PublishSubject<List<WeatherModel>>();

  //Getter for stream
  Observable<List<WeatherModel>> get weatherListStream => _weatherList.stream;

  //Getter for add method
  Function(List<WeatherModel>) get addListOfWeatherModel =>
      _weatherList.sink.add;

  dispose() {
    _weatherList.close();
  }
}
