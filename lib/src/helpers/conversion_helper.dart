int kelvinToCelsius(double k) => (k - 273.15).round();
int kelvinToFahrenheit(double k) => ((k * 9.0 / 5.0) - 459.67).round();
DateTime unixToDateTime(int unixSeconds) =>
    DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000);
