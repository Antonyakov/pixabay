import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_api_bloc/constants/icons_app.dart';
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class ImageScreenPage extends StatefulWidget {
  final ImagePixabay image;

  const ImageScreenPage({required this.image});

  @override
  _ImageScreenPageState createState() => _ImageScreenPageState();
}

class _ImageScreenPageState extends State<ImageScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    await Share.share(widget.image.pageURL ?? '');
                  },
                ),
              ],
            ),
          ),
          CachedNetworkImage(
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
            imageUrl: widget.image.largeImageURL ?? '',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
