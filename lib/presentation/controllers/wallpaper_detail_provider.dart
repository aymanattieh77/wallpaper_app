import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/app/core/functions.dart';

enum WallpaperDetailStates {
  initial,
  error,
  success,
}

class WallpaperDetailProvider extends ChangeNotifier {
  WallpaperDetailStates _states = WallpaperDetailStates.initial;
  WallpaperDetailProvider();
  WallpaperDetailStates get state => _states;
  final Dio _dio = Dio();
  void _setState(WallpaperDetailStates state) {
    _states = state;
    notifyListeners();
  }

  Future<void> downloadWallpaper(String imageUrl) async {
    // Download image
    try {
      final response = await _dio.get(imageUrl,
          options: Options(responseType: ResponseType.bytes));

      final appDir =
          await getApplicationDocumentsDirectory(); // Use getApplicationDocumentsDirectory() for internal storage
      final fileName = imageUrl.split('/').last;
      final filePath = '${appDir.path}/$fileName';
      File file = File(filePath);
      await file.writeAsBytes(response.data);

      showToastMessage(AppConstants.imageDownloadedSuccessfully);
      _setState(WallpaperDetailStates.success);
    } catch (e) {
      showToastMessage(AppConstants.failedToDownloadImage);
      _setState(WallpaperDetailStates.error);
    }
  }
}
