import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/presentation/controllers/search_provider.dart';

class SearchMoreWidget extends StatelessWidget {
  const SearchMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (_, value, __) {
        if (Provider.of<SearchProvider>(context).isLoadMore) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppConstants.kPadding20),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
