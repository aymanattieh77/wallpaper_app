import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';
import 'package:wallpaper_app/presentation/controllers/wallpaper_detail_provider.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.kkBlack,
          maximumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          context.read<WallpaperDetailProvider>().downloadWallpaper(imageUrl);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<WallpaperDetailProvider>(builder: (_, value, __) {
              bool isSuccess = value.state == WallpaperDetailStates.success;
              return Icon(
                isSuccess ? Icons.download_done : Icons.file_download_outlined,
                color: isSuccess ? AppColor.green : AppColor.white,
              );
            }),
            const SizedBox(width: 5),
            const Text(
              AppConstants.download,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
