import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_flutter/core/theme/app_colors.dart';

class ThemeDataApp {
  static final ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppDarkColors.darkBasic,
      iconTheme: const IconThemeData(
        color: AppDarkColors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    dividerColor: Colors.transparent,
    brightness: Brightness.dark,
    unselectedWidgetColor: AppDarkColors.darkText,
    iconTheme: const IconThemeData(color: AppDarkColors.darkBorder),
    shadowColor: AppHelpColors.shadowColor,
    hoverColor: AppHelpColors.lighterWhite,
    hintColor: AppHelpColors.unActiveGray,
    disabledColor: AppHelpColors.shadingColor,
    scaffoldBackgroundColor: AppDarkColors.darkBasic,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 13.0,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppDarkColors.darkBasic,
      unselectedItemColor: AppHelpColors.unActiveGray,
      selectedItemColor: AppDarkColors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.white,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.darkBorder,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.white,
        fontStyle: FontStyle.normal,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppDarkColors.white,
        fontStyle: FontStyle.normal,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.white,
        fontStyle: FontStyle.normal,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.white,
        fontStyle: FontStyle.normal,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.darkBorder,
        fontStyle: FontStyle.normal,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppDarkColors.white,
        fontStyle: FontStyle.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
    ),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppLightColors.lightBasic,
      iconTheme: const IconThemeData(
        color: AppLightColors.lightText,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    brightness: Brightness.light,
    dividerColor: Colors.transparent,
    unselectedWidgetColor: AppLightColors.lightText,
    iconTheme: const IconThemeData(color: AppLightColors.lightText),
    scaffoldBackgroundColor: AppLightColors.lightBasic,
    hintColor: AppHelpColors.unActiveGray,
    inputDecorationTheme: const InputDecorationTheme(
      //filled: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 13.0,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppLightColors.lightBasic,
      unselectedItemColor: AppHelpColors.unActiveGray,
      selectedItemColor: AppLightColors.lightText,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppLightColors.lightLighterText,
        fontStyle: FontStyle.normal,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppLightColors.lightText,
        fontStyle: FontStyle.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: AppLightColors.lightBasic,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
