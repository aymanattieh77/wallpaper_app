import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/app.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';
import 'package:wallpaper_app/presentation/controllers/favourite_prodvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startServiceLocator();
  setupHomeService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              getIt<FavouriteProvider>()..getFavouritesWallpapers(),
        ),
      ],
      child: const WallpaperApp(),
    ),
  );
}
