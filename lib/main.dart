import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixabay_api_bloc/constants/random_category.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/domain/bloc/random_images_bloc/random_images_bloc.dart';
import 'package:pixabay_api_bloc/domain/bloc/search_image_bloc/search_image_bloc.dart';
import 'package:pixabay_api_bloc/presentation/home_page.dart';

import 'domain/repository/image_pixabay_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageRepository = ImageRepository();
    final bloc = SearchImageBloc(imageRepository: imageRepository)
      ..add(SearchImageEvent.init(RandomCategory().elementRandom));
    final blocRandom = RandomImageBloc(imageRepository: imageRepository)
      ..add(RandomImageEvent.init(RandomCategory().elementRandom));
    return ScreenUtilInit(
        designSize: const Size(375, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: StringsApp.titleApp,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                displayLarge: TextStyle(
                  color: Colors.white70,
                  fontSize: 24.sp,
                ),
                displayMedium: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.sp,
                ),
              ),
            ),
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.grey[900],
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<SearchImageBloc>(
                    create: (context) => bloc,
                  ),
                  BlocProvider(
                    create: (context) => blocRandom,
                  ),
                ],
                child: HomePage(),
              ),
            ),
          );
        });
  }
}
