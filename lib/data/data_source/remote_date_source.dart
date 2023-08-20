import 'package:wallpaper_app/data/models/models.dart';
import 'package:wallpaper_app/data/remote/wallpaper_service.dart';

abstract class RemoteDataSource {
  Future<ResponseModel> searchPhotos(
      {required String query, int page = 1, int perPage = 12});

  Future<ResponseModel> getRandomWallpapers({int page = 1, int perPage = 12});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final WallpaperService _service;
  RemoteDataSourceImpl(this._service);
  @override
  Future<ResponseModel> getRandomWallpapers(
      {int page = 1, int perPage = 12}) async {
    return await _service.getRandomWallpapers(page, perPage);
  }

  @override
  Future<ResponseModel> searchPhotos(
      {required String query, int page = 1, int perPage = 12}) async {
    return await _service.searchPhotos(query, page, perPage);
  }
}
