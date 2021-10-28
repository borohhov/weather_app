import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_info.dart';

class WeatherInfoWidget extends StatelessWidget {
  final WeatherInfo weatherInfo;

  const WeatherInfoWidget(
    this.weatherInfo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 58),
            child: Column(
              children: [
                Text(weatherInfo.location, style: Theme.of(context).textTheme.bodyText2),
                Text(weatherInfo.temperature.toString(), style: Theme.of(context).textTheme.headline2),
                Text(getConditionDescription(weatherInfo.condition), style: Theme.of(context).textTheme.headline6)
              ],
            ),
          ),
        )
      ],
    );
  }
}
