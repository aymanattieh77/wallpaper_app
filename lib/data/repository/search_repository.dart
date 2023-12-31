import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wallpaper_app/data/data_source/remote_date_source.dart';
import 'package:wallpaper_app/data/errors/failure.dart';
import 'package:wallpaper_app/data/errors/server_failure.dart';
import 'package:wallpaper_app/data/network/network_info.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/domain/repository/repositories.dart';

class SearchRepositoryImpl implements SearchRepository {
  final RemoteDataSource _dataSource;
  final NetworkInfo _networkInfo;
  SearchRepositoryImpl(this._dataSource, this._networkInfo);
  @override
  Future<Either<Failure, List<Photo>>> searchPhotos(
      String query, int page) async {
    if (!await _networkInfo.isNetworkConnected()) {
      return const Left(ServerFailure(ServerMessages.internetConnectionError));
    }

    try {
      final results = await _dataSource.searchPhotos(query: query, page: page);
      //success
      return Right(results.photos);
      //
    } catch (e) {
      //failure
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
