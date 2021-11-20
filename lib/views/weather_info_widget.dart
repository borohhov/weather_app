import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/controllers/weather_retriever.dart';
import 'package:weather_app/integrations/weather_api.dart';
import 'package:weather_app/models/weather_info.dart';

class WeatherInfoWidget extends StatefulWidget {
  const WeatherInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => WeatherInfoWidgetState();
}

class WeatherInfoWidgetState extends State<WeatherInfoWidget> {
  late Future<WeatherInfo> weatherInfoFuture;

  @override
  void initState() {
    weatherInfoFuture = WeatherRetriever.getWeatherInfoFromWeatherApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 58),
            child: FutureBuilder<WeatherInfo>(
                future: weatherInfoFuture,
                builder: (BuildContext context, AsyncSnapshot<WeatherInfo> snapshot) {
                  List<Widget> widgets = [];
                  VoidCallback? onButtonPress;

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    onButtonPress = null;
                  } else {
                    onButtonPress = () {
                      setState(() {
                        weatherInfoFuture = WeatherRetriever.getWeatherInfoFromWeatherApi();
                      });
                    };
                  }
                  widgets.add(ElevatedButton(onPressed: onButtonPress, child: Text("Refresh")));
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    widgets.add(Text("Loading..."));
                  } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    widgets.add(Column(
                      children: [
                        Text(snapshot.data?.location ?? "", style: Theme.of(context).textTheme.bodyText2),
                        Text(snapshot.data?.temperature.toString() ?? "", style: Theme.of(context).textTheme.headline2),
                        Text(snapshot.data?.condition.text ?? "", style: Theme.of(context).textTheme.headline6)
                      ],
                    ));
                  }
                  return Column(
                    children: widgets,
                  );

                  ///Text("Error getting weather data");
                }),
          ),
        )
      ],
    );
  }
}
