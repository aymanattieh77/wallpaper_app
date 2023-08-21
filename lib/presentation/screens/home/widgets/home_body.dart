import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/app/constants/constants.dart';

import 'package:wallpaper_app/presentation/controllers/home_provider.dart';

import 'package:wallpaper_app/presentation/screens/home/widgets/widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<HomeProvider>().onRefresh,
      child: SingleChildScrollView(
        controller: context.read<HomeProvider>().scrollController,
        physics: const BouncingScrollPhysics(),
        child: const Column(
          children: [
            HomeHeaderSection(),
            SizedBox(height: AppConstants.kSize10),
            HomeWallpaperGirdviewSection(),
            LoadMoreWallpaperWidget(),
          ],
        ),
      ),
    );
  }
}
