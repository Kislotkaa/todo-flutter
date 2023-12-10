import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/todo_edit/todo_edit_controller.dart';

class TodoEditView extends GetView<TodoEditController> {
  const TodoEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактирование задачи'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Название задачи',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: controller.textControllerTitle,
                showCursor: true,
                enabled: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 12, left: 12),
                  hintText: 'Введите название задачи...',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor.withOpacity(0.5),
                  ),
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  counter: const SizedBox(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).hintColor.withOpacity(0.35),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).hintColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  controller.onChanged();
                },
              ),
            ),
            Text(
              'Описание задачи',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: controller.textControllerDescription,
                showCursor: true,
                enabled: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 12, left: 12),
                  hintText: 'Введите описание задачи...',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor.withOpacity(0.5),
                  ),
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  counter: const SizedBox(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).hintColor.withOpacity(0.35),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).hintColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  controller.onChanged();
                },
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () => controller.onTapSaveTodo(),
                borderRadius: BorderRadius.circular(16),
                child: const Center(
                  child: Text(
                    'Сохранить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
