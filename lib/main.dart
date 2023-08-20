import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/app.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startServiceLocator();

  runApp(const WallpaperApp());
}
