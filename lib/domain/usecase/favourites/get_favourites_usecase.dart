import 'package:dartz/dartz.dart';

import 'package:wallpaper_app/data/errors/failure.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

import 'package:wallpaper_app/domain/repository/repositories.dart';

import 'package:wallpaper_app/domain/usecase/base_usecase.dart';

class GetFavouritesUsecase extends BaseUsecase<List<Photo>, NoParam> {
  final FavouriteRepository _repository;
  GetFavouritesUsecase(this._repository);
  @override
  Future<Either<Failure, List<Photo>>> call(NoParam param) async {
    return await _repository.getFavouritePhotos();
  }
}
