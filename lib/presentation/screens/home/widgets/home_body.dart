import 'package:flutter/material.dart';
import 'package:wallpaper_app/presentation/screens/home/widgets/home_header_section.dart';
import 'package:wallpaper_app/presentation/widgets/wallpaper_girdview.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: HomeHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: WallpaperGridview(),
        )
      ],
    );
  }
}
