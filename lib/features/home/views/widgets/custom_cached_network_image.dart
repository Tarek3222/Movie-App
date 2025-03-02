import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
      required this.height,
      required this.width,
      required this.image,
      this.fit = BoxFit.cover});
  final double height;
  final double width;
  final String image;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      imageUrl: '${ApiConstants.baseUrlImage}$image',
      fit: fit,
      errorWidget: (context, url, error) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          Text(
            "Image Not Found",
            style: TextStyle(fontSize: 10.sp, color: Colors.red),
          ),
        ],
      ),
      placeholder: (context, url) => const AppLoadingIndecator(),
    );
  }
}
