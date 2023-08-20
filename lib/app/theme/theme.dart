import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';

final defaultTheme = ThemeData(
  fontFamily: "Lato",
  scaffoldBackgroundColor: Colors.white,
  // useMaterial3: true,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.black),
    bodySmall: TextStyle(
        fontSize: 18, fontWeight: FontWeight.normal, color: AppColor.black),
    labelLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.normal, color: AppColor.white),
    labelSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.white),
    labelMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.white),
  ),
);
