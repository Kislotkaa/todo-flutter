import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:todo_flutter/core/models/todo_model.dart';
import 'package:todo_flutter/core/models/todo_repository_model.dart';
import 'package:todo_flutter/app/routes/app_pages.dart';
import 'package:todo_flutter/core/repository/todo_repository.dart';
import 'package:todo_flutter/core/uikit/snackbar_widget.dart';
import 'package:todo_flutter/core/utils/error_handler.dart';
import 'package:todo_flutter/core/utils/uuid.dart';

class HomeController extends GetxController {
  final ToDoRepository toDoRepository;
  final RxList<ToDoModel> list = RxList<ToDoModel>();
  final RxInt countToDo = 0.obs;
  final RxBool isLoading = true.obs;

  final TextEditingController textControllerTitle = TextEditingController();

  HomeController({required this.toDoRepository});

  void onTapCheckBox(String todoId) {
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == todoId) {
        list[i].isActive = !list[i].isActive;
      }
    }
    _saveCache();
  }

  void onTapDelete(String todoId) {
    _removeToDo(todoId);
  }

  void replaceToDo(ToDoModel model) {
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == model.id) {
        list[i] = model;
      }
    }
    _saveCache();
  }

  Future<void> onTapNew() async {
    if (textControllerTitle.text.isEmpty) {
      showSnackbar(
        'Попробуйте назвать задачу прежде чем её создавать',
        'Название задачи отсутствует',
        status: SnackStatusEnum.warning,
      );
      return;
    }

    list.add(
      ToDoModel(
        id: genUuid(),
        title: textControllerTitle.text,
        description: '',
      ),
    );
    textControllerTitle.clear();

    await _saveCache();
  }

  Future<void> _removeToDo(String todoId) async {
    list.removeWhere((element) => element.id == todoId);
    await _saveCache();
  }

  Future<void> _saveCache() async {
    try {
      isLoading.value = true;
      await toDoRepository.saveData(ToDoRepositoryModel(list: list, countToDo: list.length).toJson());
    } catch (e, s) {
      ErrorHandler.getMessage(e, s);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadCache() async {
    try {
      isLoading.value = true;
      final result = await toDoRepository.getData();
      if (result != null) {
        var todoRepository = ToDoRepositoryModel.fromJson(result);
        list.clear();
        list.addAll(todoRepository.list);
        countToDo.value = list.length;
      }
    } catch (e, s) {
      ErrorHandler.getMessage(e, s);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Future<void> onClose() async {
    await _saveCache();
    super.onClose();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _loadCache();
  }

  Future<void> goToEditToDo(ToDoModel model) async {
    await Get.toNamed(Routes.TODO_EDIT, arguments: model);
    _loadCache();
  }
}
