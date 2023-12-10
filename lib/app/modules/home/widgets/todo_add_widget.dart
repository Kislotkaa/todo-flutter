import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/home_controller.dart';

class ToDoAddWidget extends StatelessWidget {
  ToDoAddWidget({
    super.key,
  });

  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: TextFormField(
        controller: _controller.textControllerTitle,
        showCursor: true,
        enabled: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(right: 12, left: 12),
          hintText: 'Новая задача',
          hintStyle: TextStyle(
            fontSize: 12,
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
        onEditingComplete: () {
          _controller.onTapNew();
        },
      ),
    );
  }
}
