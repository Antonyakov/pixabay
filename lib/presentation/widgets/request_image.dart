import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/domain/bloc/search_image_bloc/search_image_bloc.dart';

class RequestImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return StringsApp.hintText;
              }
              return null;
            },
            controller: cityController,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  cityController.text.isNotEmpty
                      ? context.read<SearchImageBloc>().add(
                          SearchImageEvent.searchImages(cityController.text))
                      : showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(StringsApp.requestEmpty,
                                style: Theme.of(context).textTheme.titleMedium),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(StringsApp.requestEmptyOk,
                                    style:
                                        Theme.of(context).textTheme.titleMedium),
                              ),
                            ],
                          ),
                        );
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Colors.white70, style: BorderStyle.solid)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Colors.blue, style: BorderStyle.solid)),
              hintText: StringsApp.hintText,
              hintStyle: const TextStyle(color: Colors.white70),
            ),
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
      ],
    );
  }
}
