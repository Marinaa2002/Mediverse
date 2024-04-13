import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AppBarRowChat.dart';

class CachedNetworkImageLarge extends StatelessWidget {
  const CachedNetworkImageLarge(
      {super.key, required this.imageUrl, required this.sizeOfPlaceHolder});
  final String imageUrl;
  final double sizeOfPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain, // Center the image inside the circle
          ),
        ),
      ),
      placeholder: (context, url) => PlaceholderImage(
        size: sizeOfPlaceHolder,
      ),
    );
  }
}
