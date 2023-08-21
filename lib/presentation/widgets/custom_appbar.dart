import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.kkBlack,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
