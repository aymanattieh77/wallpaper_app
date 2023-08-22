// ignore_for_file: void_checks

import 'dart:ffi';

import 'package:dartz/dartz.dart';

import 'package:wallpaper_app/data/data_source/local_data_source.dart';

import 'package:wallpaper_app/data/errors/failure.dart';

import 'package:wallpaper_app/data/mappers/mappers.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

import 'package:wallpaper_app/domain/repository/repositories.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final LocalDataSource _dataSource;
  FavouriteRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, void>> addPhotoToFavourite(Photo photo) async {
    try {
      await _dataSource.insertPhoto(photo.toModel());
      return const Right(Void);
    } on LocalException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Photo>>> getFavouritePhotos() async {
    try {
      final photos = await _dataSource.getPhotos();
      return Right(photos);
    } on LocalException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavourites(int id) async {
    try {
      await _dataSource.deletePhoto(id);
      return const Right(Void);
    } on LocalException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
