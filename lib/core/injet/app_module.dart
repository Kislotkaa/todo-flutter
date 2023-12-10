import 'package:flutter/services.dart';

Future<void> initAppModule() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await _initApi();
  _initDataSource();
  _initInteractor();
  _initRepositories();
  _initControllers();
}

Future<void> _initApi() async {}

void _initInteractor() {}

void _initDataSource() {}

void _initRepositories() {}

void _initControllers() {}
