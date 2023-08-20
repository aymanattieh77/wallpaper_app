import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper_app/data/data_source/local_data_source.dart';
import 'package:wallpaper_app/data/data_source/remote_date_source.dart';
import 'package:wallpaper_app/data/local/database_helper.dart';
import 'package:wallpaper_app/data/network/dio_factory.dart';
import 'package:wallpaper_app/data/network/network_info.dart';
import 'package:wallpaper_app/data/remote/wallpaper_service.dart';
import 'package:wallpaper_app/data/repository/favourite_repository.dart';
import 'package:wallpaper_app/data/repository/home_repository.dart';
import 'package:wallpaper_app/data/repository/search_repository.dart';
import 'package:wallpaper_app/domain/repository/repositories.dart';
import 'package:wallpaper_app/domain/usecase/favourites/add_to_favourite_usecase.dart';
import 'package:wallpaper_app/domain/usecase/favourites/get_favourites_usecase.dart';
import 'package:wallpaper_app/domain/usecase/favourites/remove_favourite_usecase.dart';
import 'package:wallpaper_app/domain/usecase/get_random_wallpapers_usecase.dart';
import 'package:wallpaper_app/domain/usecase/search_photos_usecase.dart';

final getIt = GetIt.instance;

void startServiceLocator() {
  _setupRemoteAppService();
  _setupLocalAppService();
  _setupAppRepository();
  setupUseCases();
  setupFavouriteUsecases();
}

void _setupRemoteAppService() {
  final dio = DioFactory().dio;
  getIt.registerLazySingleton<WallpaperService>(() => WallpaperService(dio));
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}

void _setupLocalAppService() {
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(databaseHelper));
}

_setupAppRepository() {
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<FavouriteRepository>(
      () => FavouriteRepositoryImpl(getIt()));
}

setupUseCases() {
  getIt.registerLazySingleton<SearchPhotoUsecase>(
      () => SearchPhotoUsecase(getIt()));
  getIt.registerLazySingleton<GetRandomWallpapersUsecase>(
      () => GetRandomWallpapersUsecase(getIt()));
}

void setupFavouriteUsecases() {
  getIt.registerLazySingleton<GetFavouritesUsecase>(
      () => GetFavouritesUsecase(getIt()));
  getIt.registerLazySingleton<AddToFavouriteUsecase>(
      () => AddToFavouriteUsecase(getIt()));
  getIt.registerLazySingleton<RemoveFavouritePhotoUsecase>(
      () => RemoveFavouritePhotoUsecase(getIt()));
}
