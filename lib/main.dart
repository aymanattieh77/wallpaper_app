import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/app.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';
import 'package:wallpaper_app/presentation/controllers/favourite_provider.dart';
import 'package:wallpaper_app/presentation/controllers/wallpaper_detail_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              getIt<FavouriteProvider>()..getFavouritesWallpapers(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<WallpaperDetailProvider>(),
        ),
      ],
      child: const WallpaperApp(),
    ),
  );
}
