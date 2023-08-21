import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';

import 'package:wallpaper_app/presentation/controllers/search_provider.dart';

import 'package:wallpaper_app/presentation/screens/search/widgets/widgets.dart';

import 'package:wallpaper_app/presentation/widgets/back_to_top_button.dart';
import 'package:wallpaper_app/presentation/widgets/custom_appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    setupSearchService();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<SearchProvider>()..start(),
      child: _getScreenContent(),
    );
  }

  Scaffold _getScreenContent() {
    return Scaffold(
      appBar: const CustomAppbar(title: AppConstants.searchPhotos),
      body: const SearchBody(),
      floatingActionButton: _searchScrollToTopButton(),
    );
  }

  Builder _searchScrollToTopButton() {
    return Builder(builder: (ctx) {
      return BackToTopButton(
        scrollController: ctx.read<SearchProvider>().scrollController,
      );
    });
  }
}
