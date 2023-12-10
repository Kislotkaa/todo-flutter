import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/modules/home/home_controller.dart';
import 'package:todo_flutter/app/modules/home/widgets/todo_add_widget.dart';
import 'package:todo_flutter/app/modules/home/widgets/todo_empty_list_widget.dart';
import 'package:todo_flutter/app/modules/home/widgets/todo_item_widget.dart';

class ToDoListWidget extends StatefulWidget {
  const ToDoListWidget({
    super.key,
  });

  @override
  State<ToDoListWidget> createState() => _ToDoListWidgetState();
}

class _ToDoListWidgetState extends State<ToDoListWidget> {
  final HomeController _controller = Get.find();

  void update() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToDoAddWidget(),
        StreamBuilder(
          stream: _controller.list.stream,
          builder: (context, snapshot) {
            if (_controller.list.isEmpty) {
              return const EmptyListWidget();
            }
            return Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 4, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_controller.list.where((model) => model.isActive == true).isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                        child: Text(
                          'Список активных задач',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ..._controller.list.where((model) => model.isActive == true).map((element) {
                      return ToDoItemWidget(
                        onTapCheckBox: () {
                          update();
                          _controller.onTapCheckBox(element.id);
                        },
                        onTapDelete: () => _controller.onTapDelete(element.id),
                        onTapItem: () => _controller.goToEditToDo(element),
                        item: element,
                      );
                    }),
                    if (_controller.list.where((model) => model.isActive == false).isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                        child: Text(
                          'Список завершённых задач',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ..._controller.list.where((model) => model.isActive == false).map((element) {
                      return ToDoItemWidget(
                        onTapCheckBox: () {
                          update();

                          _controller.onTapCheckBox(element.id);
                        },
                        onTapDelete: () => _controller.onTapDelete(element.id),
                        onTapItem: () => _controller.goToEditToDo(element),
                        item: element,
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
