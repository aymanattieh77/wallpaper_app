import 'package:flutter/material.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/app/constants/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key, this.controller, this.enabled = true, this.onSubmitted});
  final TextEditingController? controller;
  final bool enabled;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteF5,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.whiteF5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const SizedBox(
              width: 25,
              height: 25,
              child: Icon(
                Icons.search,
                color: AppColor.greyAA,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                enabled: enabled,
                controller: controller,
                onSubmitted: onSubmitted,
                maxLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.whiteF5,
                  hintStyle: const TextStyle(
                    color: AppColor.greyAA,
                    fontSize: 14,
                  ),
                  hintText: AppConstants.searchforFreePhotos,
                  enabledBorder: _border(),
                  focusedBorder: _border(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputBorder _border() {
    return InputBorder.none;
  }
}
