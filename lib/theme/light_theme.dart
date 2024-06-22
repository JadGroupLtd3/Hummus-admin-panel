import 'package:flutter/material.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';

class MyThemeData {
  static ThemeData light = ThemeData(
    applyElevationOverlayColor:false,
    fontFamily: 'Segoe UI',
    useMaterial3: false,
    primaryColor: const Color(0xff42D30F),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      secondary: Colors.white,
    ),
    cardColor: Colors.white,
    focusColor: const Color(0xFFC49A6C),
    hintColor: const Color(0xFF787878),
    hoverColor: const Color(0xff858585),
    highlightColor: const Color(0xff858585),
    backgroundColor: const Color(0xfffafafa),
    scaffoldBackgroundColor: Colors.black.withOpacity(.06),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF8DC63F)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: TajawalRegular.copyWith(color: Colors.black),
    )),
    textTheme: TextTheme(
      labelLarge: TajawalRegular.copyWith(color: Colors.white),
      displayLarge: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
      displayMedium: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      displaySmall: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      headlineMedium: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      headlineSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      titleLarge: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
      bodySmall: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
      titleMedium:
      TajawalRegular.copyWith(fontSize: 15.0, fontWeight: FontWeight.w500),
      bodyMedium: TajawalRegular.copyWith(fontSize: 12.0),
      bodyLarge:
      TajawalRegular.copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
    ),
  );
}
