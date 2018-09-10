import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_weather/src/app_config.dart';
import 'package:simple_weather/src/presentation/weather_provider.dart';
import 'package:simple_weather/src/services/localization_service.dart';
import 'package:simple_weather/src/views/weather_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          AppConfig.of(context).environment == Environment.development,
      onGenerateTitle: (BuildContext context) =>
          LocalizationsProvider.of(context).title,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      home: WeatherProvider(
        child: WeatherPage(),
      ),
    );
  }
}
