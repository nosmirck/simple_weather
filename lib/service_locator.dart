import 'package:get_it/get_it.dart';

class ServiceLocator {
  static GetIt _getIt = GetIt();

  static bool get allowReassignment => _getIt.allowReassignment;
  static set allowReassignment(value) => _getIt.allowReassignment = value;

  static call<T>() {
    return _getIt.call<T>();
  }

  static T get<T>() {
    return _getIt.get<T>();
  }

  static void registerFactory<T>(func) {
    _getIt.registerFactory<T>(func);
  }

  static void registerLazySingleton<T>(func) {
    _getIt.registerLazySingleton<T>(func);
  }

  static void registerSingleton<T>(T instance) {
    _getIt.registerSingleton<T>(instance);
  }

  static void reset() {
    _getIt.reset();
  }
}
