import 'package:flutter/material.dart';
import 'package:todo_flutter/app/app.dart';
import 'package:todo_flutter/core/injet/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const AppToDo());
}
