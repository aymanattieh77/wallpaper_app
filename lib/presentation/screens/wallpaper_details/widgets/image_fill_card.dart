import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageFillCard extends StatelessWidget {
  const ImageFillCard({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
