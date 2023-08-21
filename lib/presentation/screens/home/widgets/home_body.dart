import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/presentation/controllers/home_provider.dart';
import 'package:wallpaper_app/presentation/screens/home/widgets/home_header_section.dart';
import 'package:wallpaper_app/presentation/screens/home/widgets/home_wallpaper_section.dart';
import 'package:wallpaper_app/presentation/screens/home/widgets/load_more_wallpapers.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print("sdsd");
      },
      child: SingleChildScrollView(
        controller: Provider.of<HomeProvider>(context).scrollController,
        physics: const BouncingScrollPhysics(),
        child: const Column(
          children: [
            HomeHeaderSection(),
            SizedBox(height: 10),
            HomeWallpaperSection(),
            LoadMoreWallpaperWidget(),
          ],
        ),
      ),
    );
  }
}
