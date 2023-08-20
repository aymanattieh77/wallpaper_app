import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/data/errors/failure.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';

abstract class FavouriteRepository {
// Future<Either<Failure, List<Photo>>> getFavouritePhotos();
// Future<Either<Failure, List<Photo>>> addPhotoToFavourite();
// Future<Either<Failure, List<Photo>>> addPhotoToFavourite();
}

abstract class SearchRepository {
  Future<Either<Failure, List<Photo>>> searchPhotos(String query, int page);
}

abstract class HomeRepository {
  Future<Either<Failure, List<Photo>>> getRandomWallpapers(int page);
}
