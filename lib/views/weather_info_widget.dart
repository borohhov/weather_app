import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/integrations/weather_api.dart';
import 'package:weather_app/models/weather_info.dart';

class WeatherInfoWidget extends StatelessWidget {
  final Future<WeatherInfo> weatherInfo;

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
            child: FutureBuilder<WeatherInfo>(
              future: weatherInfo,
              builder: (BuildContext context, AsyncSnapshot<WeatherInfo> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...");
                }
                else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  return Column(
                    children: [
                      Text(snapshot.data?.location ?? "", style: Theme.of(context).textTheme.bodyText2),
                      Text(snapshot.data?.temperature.toString() ?? "", style: Theme.of(context).textTheme.headline2),
                      Text(snapshot.data?.condition.text ?? "", style: Theme.of(context).textTheme.headline6)
                    ],
                  );
                }
                return Text("Error getting weather data");

              }
            ),
          ),
        )
      ],
    );
  }
}
