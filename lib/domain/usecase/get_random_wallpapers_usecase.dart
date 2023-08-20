import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/data/error/failure.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/domain/repository/repositories.dart';
import 'package:wallpaper_app/domain/usecase/base_usecase.dart';

class GetRandomWallpapersUsecase extends BaseUsecase<List<Photo>, int> {
  final HomeRepository _repository;
  GetRandomWallpapersUsecase(this._repository);

  @override
  Future<Either<Failure, List<Photo>>> call(int param) async {
    return await _repository.getRandomWallpapers(param);
  }
}
