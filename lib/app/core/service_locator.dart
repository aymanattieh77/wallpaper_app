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
import 'package:wallpaper_app/presentation/controllers/favourite_provider.dart';
import 'package:wallpaper_app/presentation/controllers/home_provider.dart';
import 'package:wallpaper_app/presentation/controllers/search_provider.dart';
import 'package:wallpaper_app/presentation/controllers/wallpaper_detail_provider.dart';

final getIt = GetIt.instance;

void startServiceLocator() {
  _setupRemoteAppService();
  _setupLocalAppService();
  _setupAppRepository();

  setupFavouriteService();
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

setupWallpaperDetailService() {
  if (!GetIt.I.isRegistered<WallpaperDetailProvider>()) {
    getIt.registerFactory<WallpaperDetailProvider>(
        () => WallpaperDetailProvider());
  }
}

void setupFavouriteService() {
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

setupSearchService() {
  if (!GetIt.I.isRegistered<SearchProvider>()) {
    getIt.registerLazySingleton<SearchPhotoUsecase>(
        () => SearchPhotoUsecase(getIt()));
    getIt.registerFactory<SearchProvider>(() => SearchProvider(getIt()));
  }
}
