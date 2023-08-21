import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/domain/usecase/get_random_wallpapers_usecase.dart';

enum HomeStates { initial, loading, error, success }

class HomeProvider extends ChangeNotifier {
  final GetRandomWallpapersUsecase _usecase;
  HomeProvider(this._usecase);

  HomeStates _state = HomeStates.initial;
  HomeStates get state => _state;
  final scrollController = ScrollController();

  bool isLoadMore = false;
  List<Photo> photos = [];
  int page = 0;
  String errorMessage = "";

  void _setState(HomeStates state) {
    _state = state;
    notifyListeners();
  }

  Future<void> start() async {
    await _getRandomWallpapers();

    // add Listener in scrollController
    scrollController.addListener(() {
      _loadMorephotos();
    });
  }

  _loadMorephotos() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadMore = true;
      _setState(HomeStates.success);

      await _getRandomWallpapers(isFirstFetch: false);
    }
  }

  Future<void> _getRandomWallpapers({bool isFirstFetch = true}) async {
    page = _getRandomNumber();
    if (isFirstFetch) {
      _setState(HomeStates.loading);
    }

    (await _usecase.call(page)).fold(
      (failure) {
        errorMessage = failure.message;
        _setState(HomeStates.error);
      },
      (photosList) {
        photos.addAll(photosList);
        isLoadMore = false;
        _setState(HomeStates.success);
      },
    );
  }

  Future<void> onRefresh() async {
    await _getRandomWallpapers();
  }

  int _getRandomNumber() {
    return Random().nextInt(30);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
