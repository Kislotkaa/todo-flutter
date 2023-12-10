import 'package:flutter/material.dart';
import 'package:todo_flutter/core/models/todo_model.dart';
import 'package:todo_flutter/core/theme/app_colors.dart';

class ToDoItemWidget extends StatefulWidget {
  const ToDoItemWidget({
    super.key,
    required this.item,
    this.onTapCheckBox,
    this.onTapDelete,
    this.onTapItem,
  });

  final ToDoModel item;
  final Function()? onTapCheckBox;
  final Function()? onTapDelete;
  final Function()? onTapItem;

  @override
  State<ToDoItemWidget> createState() => _ToDoItemWidgetState(item.isActive);
}

class _ToDoItemWidgetState extends State<ToDoItemWidget> {
  bool isActive = true;

  _ToDoItemWidgetState(this.isActive);

  void onTapChecker() {
    setState(() {
      isActive = !isActive;
    });
    widget.onTapCheckBox != null ? widget.onTapCheckBox!() : null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapItem,
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          color: AppContsColors.white,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: widget.item.isActive,
              onChanged: (flag) {
                onTapChecker();
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  if (widget.item.description.isNotEmpty)
                    Expanded(
                      child: Text(
                        widget.item.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_forever),
              color: Theme.of(context).primaryColor,
              onPressed: widget.onTapDelete,
            )
          ],
        ),
      ),
    );
  }
}
