import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/constants.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

import 'package:wallpaper_app/presentation/widgets/wallpaper_card.dart';

class WallpaperGridview extends StatelessWidget {
  const WallpaperGridview(
      {super.key, this.physics, this.shrinkWrap = true, required this.photos});

  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppConstants.kPadding20),
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemCount: photos.length,
      shrinkWrap: shrinkWrap,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppConstants.kSize10,
        mainAxisSpacing: AppConstants.kSize10,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return WallpaperCard(
          photo: photos[index],
        );
      },
    );
  }
}
