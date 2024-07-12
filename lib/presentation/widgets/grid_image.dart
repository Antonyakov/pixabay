import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';

import 'image_item.dart';

class GridImage extends StatelessWidget {
  final List<ImagePixabay> images;

  const GridImage(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          images.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ImageItem(images[index]);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                  ),
                )
              : SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Center(
                    child: Text(StringsApp.itemsEnded,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium),
                  ),
                ),
        ],
      ),
    );
  }
}
