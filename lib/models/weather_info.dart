class WeatherInfo {
  double temperature;
  Wind wind;
  String location;
  Condition condition;

  WeatherInfo(this.temperature, this.wind, this.location, this.condition);
}

class Wind {
  double speed;
  Direction direction;

  Wind(this.speed, this.direction);
}

enum Direction {
  NORTH, SOUTH, EAST, WEST, NORTH_EAST, NORTH_WEST, SOUTH_EAST, SOUTH_WEST
}

enum Condition {
  RAIN, HEAVY_RAIN, SNOW, DRIZZLE, SUN, FOG
}

String getConditionDescription(Condition condition) {
  switch (condition) {
    case Condition.RAIN:
      return "Take an umbrella";
    default:
      return "It's some weather";
  }
}