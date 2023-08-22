import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app/app/constants/colors.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

import 'package:wallpaper_app/presentation/controllers/favourite_provider.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({
    super.key,
    required this.photo,
  });
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.read<FavouriteProvider>().favouriteOnPress(photo);
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColor.kkGrey.withOpacity(0.65),
        child: Consumer<FavouriteProvider>(builder: (_, value, __) {
          return Icon(
            value.isFavourite(photo.id)
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            color: AppColor.white,
          );
        }),
      ),
    );
  }
}
