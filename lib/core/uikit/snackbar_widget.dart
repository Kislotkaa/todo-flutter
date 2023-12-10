import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_flutter/core/constants/ui_const.dart';
import 'package:todo_flutter/core/theme/app_colors.dart';

class BaseSnackbarController extends GetxController {
  static BaseSnackbarController get to => Get.find<BaseSnackbarController>();

  void show(BuildContext context, String text, String title, {SnackStatusEnum? status}) {
    if (!Get.isSnackbarOpen) {
      switch (status) {
        case SnackStatusEnum.error:
          Get.rawSnackbar(
            titleText: Text(
              title,
              style: _getStyleTitle(),
            ),
            messageText: Text(
              text,
              style: _getStyleDescription(),
            ),
            icon: const Icon(
              Icons.error_rounded,
              color: AppContsColors.red,
            ),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(UIConst.paddingAll),
            borderRadius: UIConst.borderRadius,
            borderWidth: 1,
            borderColor: Theme.of(context).dividerColor,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            onTap: (snack) => Get.closeCurrentSnackbar(),
          );
          break;
        case SnackStatusEnum.warning:
          Get.rawSnackbar(
            titleText: Text(
              title,
              style: _getStyleTitle(),
            ),
            messageText: Text(
              text,
              style: _getStyleDescription(),
            ),
            icon: const Icon(
              Icons.warning_rounded,
              color: AppContsColors.orange,
            ),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(UIConst.paddingAll),
            borderRadius: UIConst.borderRadius,
            borderWidth: 1,
            borderColor: Theme.of(context).dividerColor,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            onTap: (snack) => Get.closeCurrentSnackbar(),
          );
          break;
        case SnackStatusEnum.access:
          Get.rawSnackbar(
            titleText: Text(
              title,
              style: _getStyleTitle(),
            ),
            messageText: Text(
              text,
              style: _getStyleDescription(),
            ),
            icon: const Icon(
              Icons.check_rounded,
              color: AppContsColors.green,
            ),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(UIConst.paddingAll),
            borderRadius: UIConst.borderRadius,
            borderWidth: 1,
            borderColor: Theme.of(context).dividerColor,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            onTap: (snack) => Get.closeCurrentSnackbar(),
          );
          break;
        default:
          Get.rawSnackbar(
            titleText: Text(
              title,
              style: _getStyleTitle(),
            ),
            messageText: Text(
              text,
              style: _getStyleDescription(),
            ),
            icon: null,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(UIConst.paddingAll),
            borderRadius: UIConst.borderRadius,
            borderWidth: 1,
            borderColor: Theme.of(context).dividerColor,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            onTap: (snack) => Get.closeCurrentSnackbar(),
          );
          break;
      }
    } else {
      Get.closeAllSnackbars();
    }
  }

  TextStyle _getStyleTitle() {
    return const TextStyle(
      fontSize: 14,
    );
  }

  TextStyle _getStyleDescription() {
    return TextStyle(
      fontSize: 12,
      color: Theme.of(Get.context!).hintColor,
    );
  }
}

void showSnackbar(
  String text,
  String title, {
  SnackStatusEnum status = SnackStatusEnum.normal,
}) {
  if (Get.context != null) {
    BaseSnackbarController.to.show(Get.context!, text, title, status: status);
  }
}

enum SnackStatusEnum { warning, access, normal, error }
