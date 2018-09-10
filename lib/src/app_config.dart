import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  final Environment environment;
  AppConfig({
    @required this.environment,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig) as AppConfig;
  }
}

enum Environment { production, development, staging, tests }
