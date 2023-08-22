import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/app/app.dart';

import 'package:wallpaper_app/app/core/service_locator.dart';

import 'package:wallpaper_app/presentation/controllers/favourite_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startServiceLocator();

  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                getIt<FavouriteProvider>()..getFavouritesWallpapers(),
          ),
        ],
        child: const WallpaperApp(),
      ),
    ),
  );
}
