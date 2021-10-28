import 'package:weather_app/models/weather_info.dart';

class WeatherRetriever {
  static WeatherInfo getDummyWeather() {
    WeatherInfo info =
        WeatherInfo(15, Wind(5, Direction.NORTH), "Tallinn", Condition.RAIN);
    return info;
  }
}
