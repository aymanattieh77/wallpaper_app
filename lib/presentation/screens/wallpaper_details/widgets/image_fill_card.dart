import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFillCard extends StatelessWidget {
  const ImageFillCard({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
