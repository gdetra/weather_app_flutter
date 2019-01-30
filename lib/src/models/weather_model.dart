class WeatherModel {
  Coord coord;
  Sys sys;
  List<Weather> weather;
  Main main;
  Wind wind;
  Rain rain;
  Clouds clouds;
  int dt;
  int id;
  String name;
  String cod;

  WeatherModel(
      {this.coord,
      this.sys,
      this.weather,
      this.main,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.id,
      this.name,
      this.cod});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    if (this.main != null) {
      data['main'] = this.main.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind.toJson();
    }
    if (this.rain != null) {
      data['rain'] = this.rain.toJson();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds.toJson();
    }
    data['dt'] = this.dt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}

class Coord {
  double lon;
  double lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'].toDouble();
    lat = json['lat'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Main {
  double temp;
  int humidity;
  double pressure;
  double tempMin;
  double tempMax;

  Main({this.temp, this.humidity, this.pressure, this.tempMin, this.tempMax});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    humidity = json['humidity'];
    pressure = json['pressure'].toDouble();
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    return data;
  }
}

class Wind {
  double speed;
  double deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'] == null ? 0.0 : json['speed'].toDouble();
    deg = json['deg'] == null ? 0.0 : json['deg'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}

class Rain {
  int i3h;

  Rain({this.i3h});

  Rain.fromJson(Map<String, dynamic> json) {
    i3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['3h'] = this.i3h;
    return data;
  }
}

class Clouds {
  int all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}
