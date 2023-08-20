import 'package:flutter/material.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/widgets/download_button.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/widgets/wallpaper_detail_body.dart';

class WallpaperDetailScreen extends StatelessWidget {
  const WallpaperDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WallpaperDetailBody(),
      floatingActionButton: DownloadButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
