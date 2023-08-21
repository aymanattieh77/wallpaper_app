import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/presentation/widgets/favourite_icon_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WallpaperDetailBody extends StatelessWidget {
  const WallpaperDetailBody({
    super.key,
    required this.imageUrl,
    required this.photographer,
  });

  final String imageUrl;
  final String photographer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              color: AppColor.kkGrey.withOpacity(0.5),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      BackButton(
                        color: AppColor.white,
                      ),
                      Spacer(),
                      FavouriteIconButton(),
                    ],
                  ),
                  const Text(
                    AppConstants.photographerBy,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                    ),
                  ),
                  Text(
                    photographer,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
