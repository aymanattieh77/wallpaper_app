import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:wallpaper_app/app/constants/colors.dart';

import 'package:wallpaper_app/app/constants/constants.dart';

import 'package:wallpaper_app/app/core/routes.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

import 'package:wallpaper_app/presentation/screens/wallpaper_details/wallpapers_details_screen.dart';

import 'package:wallpaper_app/presentation/widgets/favourite_icon_button.dart';

class WallpaperCard extends StatelessWidget {
  const WallpaperCard({
    super.key,
    required this.photo,
  });
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          AppRouter.screen(WallpaperDetailScreen(photo: photo)),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 5.5 / 8,
              child: CachedNetworkImage(
                imageUrl: photo.src.original,
                fit: BoxFit.fill,
                alignment: Alignment.center,
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.greyAA,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 5,
            child: FavouriteIconButton(
              photo: photo,
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * .10,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.kkGrey.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.photographerBy.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  photo.photographer,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
