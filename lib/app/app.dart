import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/app/routes/app_pages.dart';
import 'package:todo_flutter/core/theme/theme_data_app.dart';

class AppToDo extends StatelessWidget {
  const AppToDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ToDo",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeDataApp.light,
    );
  }
}
