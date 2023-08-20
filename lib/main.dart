import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/app.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startServiceLocator();

  // (await getIt<GetRandomWallpapersUsecase>().call(3)).fold(
  //   (failure) {
  //     print(failure.message);
  //   },
  //   (photos) {
  //     print(photos[0].id);
  //     print(photos[0].src.medium);
  //   },
  // );

  runApp(const WallpaperApp());
}
