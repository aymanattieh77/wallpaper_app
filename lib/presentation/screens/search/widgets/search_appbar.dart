import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.kkBlack,
      title: Text(
        AppConstants.searchPhotos,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
