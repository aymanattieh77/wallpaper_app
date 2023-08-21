import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/constants/constants.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: AppConstants.searchPhotos),
      body: const SearchBody(),
      floatingActionButton: BackToTopButton(
        scrollController: context.read<SearchProvider>().scrollController,
      ),
    );
  }

  @override
  void dispose() {
    context.read<SearchProvider>().dispose();
    super.dispose();
  }
}
