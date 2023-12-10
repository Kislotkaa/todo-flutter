import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/todo_edit/todo_edit_binding.dart';
import '../modules/todo_edit/todo_edit_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TODO_EDIT,
      page: () => const TodoEditView(),
      binding: TodoEditBinding(),
    ),
  ];
}
