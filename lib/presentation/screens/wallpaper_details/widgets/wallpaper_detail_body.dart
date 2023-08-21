import 'package:flutter/material.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/widgets/image_fill_card.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/widgets/wallpaper_header_section.dart';

class WallpaperDetailBody extends StatelessWidget {
  const WallpaperDetailBody({
    super.key,
    required this.imageUrl,
    required this.photographer,
  });

  final String imageUrl;
  final String photographer;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFillCard(imageUrl: imageUrl),
        WallpaperDetailHeaderSection(photographer: photographer),
      ],
    );
  }
}
