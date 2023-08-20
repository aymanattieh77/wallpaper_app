import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/presentation/screens/wallpaper_details/wallpapers_details_screen.dart';
import 'package:wallpaper_app/presentation/widgets/favourite_icon_button.dart';

class WallpaperCard extends StatelessWidget {
  const WallpaperCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WallpaperDetailScreen(),
          ),
        );
      },
      child: SizedBox(
        // width: MediaQuery.sizeOf(context).width * .45,
        // height: MediaQuery.sizeOf(context).height * .40,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 5.5 / 8,
                child: Image.asset(
                  "assets/images/test_photo.jpeg", //TODO
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Positioned(
              top: 30,
              right: 5,
              child: FavouriteIconButton(),
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
                    "ayman attieh", //TODO photographer name
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
