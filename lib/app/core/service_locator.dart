import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:wallpaper_app/data/data_source/local_data_source.dart';
import 'package:wallpaper_app/data/data_source/remote_date_source.dart';

import 'package:wallpaper_app/data/network/dio_factory.dart';
import 'package:wallpaper_app/data/network/network_info.dart';

import 'package:wallpaper_app/data/remote/wallpaper_service.dart';
import 'package:wallpaper_app/data/local/database_helper.dart';

import 'package:wallpaper_app/data/repository/favourite_repository.dart';
import 'package:wallpaper_app/data/repository/home_repository.dart';
import 'package:wallpaper_app/data/repository/search_repository.dart';

import 'package:wallpaper_app/domain/repository/repositories.dart';

import 'package:wallpaper_app/domain/usecase/usecases.dart';

import 'package:wallpaper_app/presentation/controllers/providers.dart';

final getIt = GetIt.instance;

void startServiceLocator() {
  _setupRemoteAppService();
  _setupLocalAppService();
  _setupAppRepository();
  _setupFavouriteService();
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

void _setupAppRepository() {
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<FavouriteRepository>(
      () => FavouriteRepositoryImpl(getIt()));
}

void setupWallpaperDetailService() {
  if (!GetIt.I.isRegistered<WallpaperDetailProvider>()) {
    getIt.registerFactory<WallpaperDetailProvider>(
        () => WallpaperDetailProvider());
  }
}

void _setupFavouriteService() {
  if (!GetIt.I.isRegistered<FavouriteProvider>()) {
    getIt.registerLazySingleton<GetFavouritesUsecase>(
        () => GetFavouritesUsecase(getIt()));
    getIt.registerLazySingleton<AddToFavouriteUsecase>(
        () => AddToFavouriteUsecase(getIt()));
    getIt.registerLazySingleton<RemoveFavouritePhotoUsecase>(
        () => RemoveFavouritePhotoUsecase(getIt()));
    getIt.registerFactory<FavouriteProvider>(
        () => FavouriteProvider(getIt(), getIt(), getIt()));
  }
}

void setupHomeService() {
  if (!GetIt.I.isRegistered<HomeProvider>()) {
    getIt.registerLazySingleton<GetRandomWallpapersUsecase>(
        () => GetRandomWallpapersUsecase(getIt()));
    getIt.registerFactory<HomeProvider>(() => HomeProvider(getIt()));
  }
}

void setupSearchService() {
  if (!GetIt.I.isRegistered<SearchProvider>()) {
    getIt.registerLazySingleton<SearchPhotoUsecase>(
        () => SearchPhotoUsecase(getIt()));
    getIt.registerFactory<SearchProvider>(() => SearchProvider(getIt()));
  }
}
