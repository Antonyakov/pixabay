import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/domain/bloc/random_images_bloc/random_images_bloc.dart';
import 'package:pixabay_api_bloc/presentation/widgets/grid_image.dart';
import 'package:pixabay_api_bloc/presentation/widgets/request_image.dart';

class RandomImagePage extends StatefulWidget {
  @override
  State<RandomImagePage> createState() => _RandomImagePageState();
}

class _RandomImagePageState extends State<RandomImagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImageBloc, RandomImageState>(
        builder: (context, state) {
      return state.maybeMap(
        orElse: SizedBox.fromSize,
        loaded: (state) {
          return Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Random Images for ${state.category}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                GridImage(state.images ?? [])
              ],
            ),
          );
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
