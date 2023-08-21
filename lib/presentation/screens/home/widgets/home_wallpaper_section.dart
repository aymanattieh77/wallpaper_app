import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/presentation/controllers/home_provider.dart';
import 'package:wallpaper_app/presentation/widgets/wallpaper_girdview.dart';

class HomeWallpaperSection extends StatelessWidget {
  const HomeWallpaperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, value, __) {
        if (value.state == HomeStates.loading) {
          return const CircularProgressIndicator();
        } else if (value.state == HomeStates.error) {
          return Container(
            height: 10,
            color: Colors.red,
          );
        } else if (value.state == HomeStates.success) {
          return WallpaperGridview(photos: value.photos);
        } else {
          return Container(
            height: 10,
            color: Colors.yellowAccent,
          );
        }
      },
    );
  }
}
