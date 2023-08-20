import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/theme/theme.dart';
import 'package:wallpaper_app/presentation/screens/home/home_screen.dart';

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      home: const HomeScreen(),
    );
  }
}
