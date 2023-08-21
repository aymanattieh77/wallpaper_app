import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/core/functions.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/domain/usecase/base_usecase.dart';
import 'package:wallpaper_app/domain/usecase/favourites/add_to_favourite_usecase.dart';
import 'package:wallpaper_app/domain/usecase/favourites/get_favourites_usecase.dart';
import 'package:wallpaper_app/domain/usecase/favourites/remove_favourite_usecase.dart';

enum FavouriteStates { initial, loading, error, success, empty }

class FavouriteProvider extends ChangeNotifier {
  FavouriteStates _states = FavouriteStates.initial;
  FavouriteProvider(this._getFavouritesUsecase, this._addToFavouriteUsecase,
      this._removeFavouritePhotoUsecase);
  FavouriteStates get state => _states;
  List<Photo> photos = [];
  String errorMessage = "";
  void _setState(FavouriteStates state) {
    _states = state;
    notifyListeners();
  }

  bool isFavourite(int id) {
    return photos.any((element) => element.id == id);
  }

  final GetFavouritesUsecase _getFavouritesUsecase;
  final AddToFavouriteUsecase _addToFavouriteUsecase;
  final RemoveFavouritePhotoUsecase _removeFavouritePhotoUsecase;

  Future<void> getFavouritesWallpapers() async {
    _setState(FavouriteStates.loading);
    (await _getFavouritesUsecase.call(const NoParam())).fold(
      (failure) {
        errorMessage = failure.message;
        _setState(FavouriteStates.error);
      },
      (photosList) {
        if (photosList.isEmpty) {
          _setState(FavouriteStates.empty);
          return;
        }
        photos = photosList;
        _setState(FavouriteStates.success);
      },
    );
  }

  Future<void> favouriteOnPress(Photo photo) async {
    await getFavouritesWallpapers();
    final isPhotoExist = photos.any((element) => element.id == photo.id);

    isPhotoExist ? await _removePhoto(photo) : await _addPhoto(photo);
  }

  Future<void> _addPhotoToFavourite(Photo photo) async {
    (await _addToFavouriteUsecase.call(photo)).fold(
      (failure) {
        showToastMessage(failure.message);
      },
      (_) {
        _setState(FavouriteStates.success);
      },
    );
  }

  Future<void> _removePhotoFromFavourites(int id) async {
    (await _removeFavouritePhotoUsecase.call(id)).fold(
      (failure) {
        showToastMessage(failure.message);
      },
      (_) {
        _setState(FavouriteStates.success);
      },
    );
  }

  Future<void> _addPhoto(Photo photo) async {
    await _addPhotoToFavourite(photo);
    photos.add(photo);
  }

  Future<void> _removePhoto(Photo photo) async {
    await _removePhotoFromFavourites(photo.id);
    photos.removeWhere((element) => element.id == photo.id);
  }
}
