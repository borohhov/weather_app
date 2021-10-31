class WeatherApiObject {
  late _Location location;
  late _CurrentWeather currentWeather;

  WeatherApiObject(this.location, this.currentWeather);

  factory WeatherApiObject.fromJson(Map<String, dynamic> json) {
    return WeatherApiObject(_Location.fromJson(json["location"]), _CurrentWeather.fromJson(json["current"]));
  }
}

class _Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;

  _Location(this.name, this.region, this.country, this.lat, this.lon);

  factory _Location.fromJson(Map<String, dynamic> json) {
    return _Location(json["name"], json["region"], json["country"], json["lat"], json["lon"]);
  }

}

class _CurrentWeather {
  double tempCelsius;
  _Condition condition;
  double windKph;
  String windDir;
  double feelsLikeCelcius;

  _CurrentWeather(this.tempCelsius, this.condition, this.windKph, this.windDir, this.feelsLikeCelcius);

  factory _CurrentWeather.fromJson(Map<String, dynamic> json) {
    return _CurrentWeather(json["temp_c"], _Condition.fromJson(json["condition"]),
        json["wind_kph"], json["wind_dir"], json["feelslike_c"]);
  }
}

class _Condition {
  String text;

  _Condition(this.text);

  factory _Condition.fromJson(Map<String, dynamic> json) {
    return _Condition(json['text']);
  }
}
