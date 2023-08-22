import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/app/core/functions.dart';

import 'package:wallpaper_app/presentation/controllers/search_provider.dart';

import 'package:wallpaper_app/presentation/widgets/wallpaper_girdview.dart';

class SearchWallpaperGirdviewSection extends StatelessWidget {
  const SearchWallpaperGirdviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (_, value, __) {
        if (value.state == SearchStates.loading) {
          return customLoadingIndicator();
        } else if (value.state == SearchStates.error) {
          showErrorDialog(context, value.errorMessage);
          return const SizedBox();
        } else if (value.state == SearchStates.success) {
          return WallpaperGridview(photos: value.photos);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
