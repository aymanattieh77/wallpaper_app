import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/app/core/routes.dart';
import 'package:wallpaper_app/presentation/screens/search/widgets/search_field.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.exploreFree,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    AppConstants.wallpapers,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.favourites);
                },
                icon: const Icon(Icons.favorite, color: AppColor.black),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              _goSearchScreen(context);
            },
            child: const SearchField(
              enabled: false,
            ),
          ),
        ],
      ),
    );
  }

  _goSearchScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.search);
  }
}
