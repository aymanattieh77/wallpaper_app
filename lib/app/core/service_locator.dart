import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper_app/data/data_source/remote_date_source.dart';
import 'package:wallpaper_app/data/network/dio_factory.dart';
import 'package:wallpaper_app/data/network/network_info.dart';
import 'package:wallpaper_app/data/remote/wallpaper_service.dart';
import 'package:wallpaper_app/data/repository/home_repository.dart';
import 'package:wallpaper_app/data/repository/search_repository.dart';
import 'package:wallpaper_app/domain/repository/repositories.dart';
import 'package:wallpaper_app/domain/usecase/get_random_wallpapers_usecase.dart';
import 'package:wallpaper_app/domain/usecase/search_photos_usecase.dart';

final getIt = GetIt.instance;

void startServiceLocator() {
  _setupAppService();
  _setupAppRepository();
  setupUseCases();
}

void _setupAppService() {
  final dio = DioFactory().dio;
  getIt.registerLazySingleton<WallpaperService>(() => WallpaperService(dio));
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}

_setupAppRepository() {
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt(), getIt()));
}

setupUseCases() {
  getIt.registerLazySingleton<SearchPhotoUsecase>(
      () => SearchPhotoUsecase(getIt()));
  getIt.registerLazySingleton<GetRandomWallpapersUsecase>(
      () => GetRandomWallpapersUsecase(getIt()));
}