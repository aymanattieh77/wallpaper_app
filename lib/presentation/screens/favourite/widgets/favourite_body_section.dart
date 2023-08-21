import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/core/functions.dart';
import 'package:wallpaper_app/presentation/controllers/favourite_provider.dart';
import 'package:wallpaper_app/presentation/screens/favourite/widgets/favourite_empty_widget.dart';
import 'package:wallpaper_app/presentation/widgets/wallpaper_girdview.dart';

class FavouritesBodySection extends StatelessWidget {
  const FavouritesBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (_, value, __) {
        if (value.state == FavouriteStates.loading) {
          return customLoadingIndicator();
        } else if (value.state == FavouriteStates.error) {
          return Container();
        } else if (value.state == FavouriteStates.empty) {
          return const FavouriteEmptyWidget();
        } else if (value.state == FavouriteStates.success) {
          return WallpaperGridview(
            shrinkWrap: false,
            physics: const BouncingScrollPhysics(),
            photos: value.photos,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
