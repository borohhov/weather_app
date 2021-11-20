import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

class WeatherInfo {
  double temperature;

  //Wind wind;
  String location;
  Condition condition;

  WeatherInfo(this.temperature, this.location, this.condition);

  Map<String, dynamic> toJson() => {'temperature': temperature, 'location': location, 'Condition': condition.toJson()};

  WeatherInfo.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        location = json['location'],
        condition = Condition.fromJson(json['condition']);

  @override
  String toString() {
    String json = jsonEncode(toJson());
    return json;
  }

  static WeatherInfo fromString(String weatherString) {
    return jsonDecode(weatherString);
  }
}

class Condition {
  String text;

  Condition(this.text);

  Map<String, dynamic> toJson() => {'text': text};

  Condition.fromJson(Map<String, dynamic> json) : text = json['text'];

  @override
  String toString() {
    String json = jsonEncode(this);
    return json;
  }
}
