import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/constants.dart';

class FavouriteEmptyWidget extends StatelessWidget {
  const FavouriteEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.favorite, size: 150),
        const SizedBox(height: AppConstants.kSize15 * 2),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.kPadding20),
          child: Text(
            AppConstants.youDontHaveFavourite,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
