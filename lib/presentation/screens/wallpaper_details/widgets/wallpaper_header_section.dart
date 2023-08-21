import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';
import 'package:wallpaper_app/presentation/widgets/favourite_icon_button.dart';

class WallpaperDetailHeaderSection extends StatelessWidget {
  const WallpaperDetailHeaderSection({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        color: AppColor.kkGrey.withOpacity(0.5),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BackButton(
                  color: AppColor.white,
                ),
                const Spacer(),
                FavouriteIconButton(
                  photo: photo,
                ),
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
              photo.photographer,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
