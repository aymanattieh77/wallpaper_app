import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/presentation/controllers/favourite_provider.dart';
import 'package:wallpaper_app/presentation/screens/favourite/widgets/favourite_body_section.dart';
import 'package:wallpaper_app/presentation/widgets/custom_appbar.dart';

class FavourtiteScreen extends StatefulWidget {
  const FavourtiteScreen({super.key});

  @override
  State<FavourtiteScreen> createState() => _FavourtiteScreenState();
}

class _FavourtiteScreenState extends State<FavourtiteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FavouriteProvider>(context, listen: false)
          .getFavouritesWallpapers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: AppConstants.favoritesPhotos),
      body: FavouritesBodySection(),
    );
  }
}
