import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/presentation/controllers/home_provider.dart';

class LoadMoreWallpaperWidget extends StatelessWidget {
  const LoadMoreWallpaperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, value, __) {
        if (Provider.of<HomeProvider>(context).isLoadMore) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
