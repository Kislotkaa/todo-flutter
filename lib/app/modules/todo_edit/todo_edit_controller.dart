import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/home_controller.dart';
import 'package:todo_flutter/core/models/todo_model.dart';
import 'package:todo_flutter/core/uikit/snackbar_widget.dart';

class TodoEditController extends GetxController {
  TodoEditController({required this.homeController});

  final HomeController homeController;
  final Rxn<ToDoModel> model = Rxn<ToDoModel>();
  final TextEditingController textControllerTitle = TextEditingController();
  final TextEditingController textControllerDescription = TextEditingController();

  void onTapSaveTodo() {
    if (model.value != null) {
      if (textControllerTitle.text.isEmpty) {
        showSnackbar(
          'Попробуйте назвать задачу прежде чем её создавать',
          'Название задачи отсутствует',
          status: SnackStatusEnum.warning,
        );
        return;
      }
      homeController.replaceToDo(model.value!);
      Get.back();
    }
  }

  void onTapChangeStatus() {
    model.value!.isActive = !model.value!.isActive;
  }

  void onChanged() {
    if (model.value != null) {
      model.value!.title = textControllerTitle.text;
      model.value!.description = textControllerDescription.text;
    }
  }

  @override
  void onInit() {
    ToDoModel argument = Get.arguments;
    textControllerTitle.text = argument.title;
    textControllerDescription.text = argument.description;
    model.value = argument;
    super.onInit();
  }
}
