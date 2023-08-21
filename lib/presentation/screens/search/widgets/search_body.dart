import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/presentation/controllers/search_provider.dart';
import 'package:wallpaper_app/presentation/screens/search/widgets/search_header_section.dart';
import 'package:wallpaper_app/presentation/screens/search/widgets/search_more_widget.dart';
import 'package:wallpaper_app/presentation/screens/search/widgets/search_wallpaper_girdview_section.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: context.read<SearchProvider>().scrollController,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchHeaderSection(),
          SearchWallpaperGirdviewSection(),
          SearchMoreWidget()
        ],
      ),
    );
  }
}
