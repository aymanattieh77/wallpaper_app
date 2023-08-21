import 'package:flutter/material.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/widgets/download_button.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/widgets/wallpaper_detail_body.dart';

class WallpaperDetailScreen extends StatelessWidget {
  const WallpaperDetailScreen({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WallpaperDetailBody(photo: photo),
      floatingActionButton: DownloadButton(imageUrl: photo.src.large),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
