import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:todo_flutter/app/modules/home/home_controller.dart';
import 'package:todo_flutter/core/repository/todo_repository.dart';
import 'package:todo_flutter/core/uikit/snackbar_widget.dart';

Future<void> initAppModule() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  await _initApi();
  _initDataSource();
  _initInteractor();
  await _initRepositories();
  _initControllers();
}

Future<void> _initApi() async {}

void _initInteractor() {}

void _initDataSource() {}

Future<void> _initRepositories() async {
  await Get.put(ToDoRepository()).init();
}

void _initControllers() {
  Get
    ..put(BaseSnackbarController())
    ..put(HomeController(toDoRepository: Get.find()));
}
