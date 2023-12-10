import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ToDoRepository extends DisposableInterface {
  final key = 'todos';
  late Box box;

  Future<void> init() async {
    await _initCache();
  }

  Future<void> _initCache() async {
    try {
      box = await Hive.openBox('todo_box');
    } catch (e) {
      printError(info: 'error init ToDoRepository');
    }
  }

  Future<void> saveData(String json) async {
    await box.put(key, json);
  }

  Future<String?> getData() async {
    return await box.get(key);
  }
}
