import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:wallpaper_app/app/constants/constants.dart';

import 'package:wallpaper_app/data/models/models.dart';

part 'wallpaper_service.g.dart';

@RestApi(baseUrl: AppConstants.pexelsBaseUrl)
abstract class WallpaperService {
  factory WallpaperService(Dio dio, {String? baseUrl}) = _WallpaperService;

  @GET("search")
  Future<ResponseModel> searchPhotos(@Query("query") String query,
      [@Query("page") int page = 1,
      @Query("per_page") int perPage = AppConstants.perPage]);

  @GET("curated")
  Future<ResponseModel> getRandomWallpapers(
      [@Query("page") int page = 1,
      @Query("per_page") int perPage = AppConstants.perPage]);
}
