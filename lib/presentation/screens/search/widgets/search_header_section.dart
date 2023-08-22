import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/app/constants/constants.dart';

import 'package:wallpaper_app/presentation/controllers/search_provider.dart';

import 'package:wallpaper_app/presentation/screens/search/widgets/search_field.dart';

class SearchHeaderSection extends StatelessWidget {
  const SearchHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.kPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(
            onSubmitted: Provider.of<SearchProvider>(context).onFieldSubmit,
          ),
          const SizedBox(height: AppConstants.kSize15),
          Consumer<SearchProvider>(
            builder: (_, value, __) {
              return Text("${AppConstants.youSearchFor}'${value.searchQuery}'");
            },
          ),
        ],
      ),
    );
  }
}
