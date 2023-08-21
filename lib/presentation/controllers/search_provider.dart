import 'package:flutter/material.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/domain/usecase/search_photos_usecase.dart';

enum SearchStates { initial, loading, error, success }

class SearchProvider extends ChangeNotifier {
  final SearchPhotoUsecase _usecase;
  SearchProvider(this._usecase);

  SearchStates _state = SearchStates.initial;
  SearchStates get state => _state;
  final scrollController = ScrollController();

  bool isLoadMore = false;
  List<Photo> photos = [];
  String errorMessage = "";
  int page = 0;
  String searchQuery = "";
  start() {
    // add Listener in scrollController
    scrollController.addListener(() {
      _loadMorephotos();
    });
  }

  _loadMorephotos() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadMore = true;
      _setState(SearchStates.success);
      page++;
      await searchPhotos(isFirstFetch: false);
    }
  }

  void onFieldSubmit(String searchValue) async {
    if (searchValue.isEmpty) {
      return;
    }
    searchQuery = searchValue;
    await searchPhotos(isFirstFetch: true);
  }

  void _setState(SearchStates state) {
    _state = state;
    notifyListeners();
  }

  Future<void> searchPhotos({bool isFirstFetch = true}) async {
    if (isFirstFetch) {
      _setState(SearchStates.loading);
    }

    (await _usecase.call(SearchInputs(query: searchQuery, page: page))).fold(
      (failure) {
        errorMessage = failure.message;
        _setState(SearchStates.error);
      },
      (photosList) {
        photos.addAll(photosList);
        isLoadMore = false;
        _setState(SearchStates.success);
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
