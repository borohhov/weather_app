import 'package:weather_app/integrations/models/weather_api_object.dart';
import 'package:weather_app/integrations/weather_api.dart';
import 'package:weather_app/models/weather_info.dart';

class WeatherRetriever {

  static Future<WeatherInfo> getWeatherInfoFromWeatherApi() async {
    WeatherApiObject weatherApiObject = await WeatherApiIntegration.getWeatherInfo();
    return _convertWeatherApiToWeatherInfo(weatherApiObject);
  }

  static WeatherInfo _convertWeatherApiToWeatherInfo(WeatherApiObject weatherApiObject) {
    Wind wind =
        Wind(weatherApiObject.currentWeather.windKph, directionFromString(weatherApiObject.currentWeather.windDir));

    WeatherInfo weatherInfo = WeatherInfo(weatherApiObject.currentWeather.tempCelsius, wind,
        weatherApiObject.location.name, Condition(weatherApiObject.currentWeather.condition.text));
    return weatherInfo;
  }
}
