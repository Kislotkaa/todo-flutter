import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/home_controller.dart';
import 'package:todo_flutter/app/modules/home/widgets/todo_list_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Simple ToDo'),
        centerTitle: true,
      ),
      body: const ToDoListWidget(),
    );
  }
}
