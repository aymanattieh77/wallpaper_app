import 'package:wallpaper_app/data/local/database_helper.dart';
import 'package:wallpaper_app/data/models/models.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';

abstract class LocalDataSource {
  Future<void> insertPhoto(PhotoModel photo);
  Future<void> deletePhoto(int id);
  Future<List<Photo>> getPhotos();
}

class LocalDataSourceImpl extends LocalDataSource {
  final DatabaseHelper _databaseHelper;
  LocalDataSourceImpl(this._databaseHelper);
  @override
  Future<void> deletePhoto(int id) async {
    return await _databaseHelper.deletePhoto(id);
  }

  @override
  Future<List<Photo>> getPhotos() async {
    return await _databaseHelper.getPhotos();
  }

  @override
  Future<void> insertPhoto(PhotoModel photo) async {
    return await _databaseHelper.insertPhoto(photo);
  }
}
