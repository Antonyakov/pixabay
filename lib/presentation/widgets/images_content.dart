import 'package:flutter/material.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/presentation/widgets/request_image.dart';

import 'grid_image.dart';

class ImageContent extends StatelessWidget {
  final List<ImagePixabay> images;
  final String? category;

  const ImageContent(this.images, this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          RequestImage(),
          category != null
              ? const Center(
              child: Text(
                StringsApp.randomTitleBar,
                style: TextStyle(color: Colors.white),
              ))
              : const SizedBox(),
          GridImage(images),
        ],
      ),
    );
  }
}
