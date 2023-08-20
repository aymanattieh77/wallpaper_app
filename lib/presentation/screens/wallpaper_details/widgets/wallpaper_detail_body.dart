import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/presentation/widgets/favourite_icon_button.dart';

class WallpaperDetailBody extends StatelessWidget {
  const WallpaperDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/test_photo.jpeg", //TODO
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              color: AppColor.kkGrey.withOpacity(0.5),
              padding: const EdgeInsets.all(20),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BackButton(
                        color: AppColor.white,
                      ),
                      Spacer(),
                      FavouriteIconButton(),
                    ],
                  ),
                  Text(
                    "Photographer By",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                    ),
                  ),
                  Text(
                    "Ayman attieh",
                    style: TextStyle(
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
