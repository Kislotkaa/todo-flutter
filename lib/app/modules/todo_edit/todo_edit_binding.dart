import 'package:get/get.dart';

import 'package:todo_flutter/app/modules/todo_edit/todo_edit_controller.dart';

class TodoEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoEditController>(
      () => TodoEditController(
        homeController: Get.find(),
      ),
    );
  }
}
