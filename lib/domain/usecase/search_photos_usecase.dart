import 'package:dartz/dartz.dart';

import 'package:wallpaper_app/data/errors/failure.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

import 'package:wallpaper_app/domain/repository/repositories.dart';

import 'package:wallpaper_app/domain/usecase/base_usecase.dart';

class SearchPhotoUsecase extends BaseUsecase<List<Photo>, SearchInputs> {
  final SearchRepository _repository;
  SearchPhotoUsecase(this._repository);
  @override
  Future<Either<Failure, List<Photo>>> call(SearchInputs param) async {
    return await _repository.searchPhotos(param.query, param.page);
  }
}

class SearchInputs {
  final String query;
  final int page;
  SearchInputs({
    required this.query,
    required this.page,
  });
}
