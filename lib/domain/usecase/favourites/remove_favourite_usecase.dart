import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/data/errors/failure.dart';
import 'package:wallpaper_app/domain/repository/repositories.dart';
import 'package:wallpaper_app/domain/usecase/base_usecase.dart';

class RemoveFavouritePhotoUsecase extends BaseUsecase<void, int> {
  final FavouriteRepository _repository;
  RemoveFavouritePhotoUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(int param) async {
    return await _repository.removeFromFavourites(param);
  }
}
