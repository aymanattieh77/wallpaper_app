import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColor.kkGrey.withOpacity(0.65),
        child: const Icon(
          Icons.favorite_border_outlined,
          color: AppColor.white,
        ),
      ),
    );
  }
}
