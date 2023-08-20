import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/app.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';
import 'package:wallpaper_app/data/data_source/local_data_source.dart';
import 'package:wallpaper_app/data/mappers/mappers.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startServiceLocator();

  const photo = Photo(
    id: 65565,
    width: 45454,
    height: 45454,
    photographer: "SADsad",
    alt: "dasdsadas",
    url: "DASdasdadsa",
    src: Src(original: "Sdas", large: "SDASD", medium: "medium"),
  );

  await getIt<LocalDataSource>().insertPhoto(photo.toModel());

  // (await getIt<GetRandomWallpapersUsecase>().call(3)).fold(
  //   (failure) {
  //     print(failure.message);
  //   },
  //   (photos) {
  //     print(photos[0].id);
  //     print(photos[0].src.medium);
  //   },
  // );
  await getIt<LocalDataSource>().getPhotos().then((value) {
    print(value);
  });
  runApp(const WallpaperApp());
}
