import 'package:get_it/get_it.dart';
import 'package:wallpaper_app/data/data_source/remote_date_source.dart';
import 'package:wallpaper_app/data/network/dio_factory.dart';
import 'package:wallpaper_app/data/remote/wallpaper_service.dart';

final getIt = GetIt.instance;

void setupAppService() {
  final dio = DioFactory().dio;
  getIt.registerLazySingleton<WallpaperService>(() => WallpaperService(dio));
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(getIt()));
}
