import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/data/errors/failure.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/domain/repository/repositories.dart';
import 'package:wallpaper_app/domain/usecase/base_usecase.dart';

class AddToFavouriteUsecase extends BaseUsecase<void, Photo> {
  final FavouriteRepository _repository;
  AddToFavouriteUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(Photo param) async {
    return await _repository.addPhotoToFavourite(param);
  }
}
