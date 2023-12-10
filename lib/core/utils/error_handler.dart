import 'package:todo_flutter/core/uikit/snackbar_widget.dart';

class ErrorHandler {
  static getMessage(dynamic e, StackTrace s) {
    showSnackbar(
      e.toString(),
      'Что то пошло не так...',
      status: SnackStatusEnum.warning,
    );
  }
}
