
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/domain/bloc/search_image_bloc/search_image_bloc.dart';
import 'package:pixabay_api_bloc/presentation/widgets/images_content.dart';
import 'package:pixabay_api_bloc/presentation/widgets/request_image.dart';

class GalleryImagePage extends StatefulWidget {
  @override
  State<GalleryImagePage> createState() => _GalleryImagePageState();
}

class _GalleryImagePageState extends State<GalleryImagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchImageBloc, SearchImageState>(
        builder: (context, state) {
      return state.maybeMap(
        orElse: SizedBox.fromSize,
        loaded: (state) {
          return ImageContent(state.images ?? [], state.category);
        },
        loading: (_) => const Center(
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ),
        ),
        errorState: (state) => Column(
          children: [
            RequestImage(),
            const Center(
              child: Text(
                StringsApp.noConnectionExceptionState,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    });
  }
}
