import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_api_bloc/constants/icons_app.dart';
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/presentation/image_screen_page.dart';
import 'package:shimmer/shimmer.dart';


class ImageItem extends StatelessWidget {
  final ImagePixabay image;

  const ImageItem(this.image, {super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ImageScreenPage(image: image)));
      },
      child: CachedNetworkImage(
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey.shade500,
          child: Center(
            child: SvgPicture.asset(
              IconsApp.imageLoader,
              fit: BoxFit.cover,
              height: 40.h,
              width: 40.w,
            ),
          ),
        ),
        height: 120.h,
        width: 120.w,
        imageUrl: image.webFormatURL??'',
        fit: BoxFit.fitWidth,
        errorWidget: (context, url, error) {
          return Center(
            child: SizedBox(
              height: 40.h,
              width: 40.w,
              child: SvgPicture.asset(
                IconsApp.imageNotFound,
                color: Colors.white70,
                height: 40.h,
                width: 40.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
