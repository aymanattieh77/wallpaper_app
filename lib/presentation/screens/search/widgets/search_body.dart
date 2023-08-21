import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/presentation/controllers/search_provider.dart';

import 'package:wallpaper_app/presentation/screens/search/widgets/widgets.dart';

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
        children: [
          SearchHeaderSection(),
          SearchWallpaperGirdviewSection(),
          SearchMoreWidget()
        ],
      ),
    );
  }
}
