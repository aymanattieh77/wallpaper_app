import 'package:flutter/material.dart';
import 'package:wallpaper_app/presentation/widgets/wallpaper_card.dart';

class WallpaperGridview extends StatelessWidget {
  const WallpaperGridview({super.key, this.physics, this.shrinkWrap = true});

  final ScrollPhysics? physics;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemCount: 12,
      shrinkWrap: shrinkWrap,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return const WallpaperCard(); //TODO
      },
    );
  }
}
