import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/app/core/functions.dart';

import 'package:wallpaper_app/presentation/controllers/home_provider.dart';

import 'package:wallpaper_app/presentation/widgets/wallpaper_girdview.dart';

class HomeWallpaperGirdviewSection extends StatelessWidget {
  const HomeWallpaperGirdviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, value, __) {
        if (value.state == HomeStates.loading) {
          return const CircularProgressIndicator();
        } else if (value.state == HomeStates.error) {
          showErrorDialog(context, value.errorMessage);
          return const SizedBox();
        } else if (value.state == HomeStates.success) {
          return WallpaperGridview(
            photos: value.photos,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
