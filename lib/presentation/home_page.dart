import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_api_bloc/constants/random_category.dart';
import 'package:pixabay_api_bloc/constants/strings_app.dart';
import 'package:pixabay_api_bloc/domain/bloc/random_images_bloc/random_images_bloc.dart';
import 'package:pixabay_api_bloc/domain/bloc/search_image_bloc/search_image_bloc.dart';
import 'package:pixabay_api_bloc/presentation/gallery_image_page.dart';
import 'package:pixabay_api_bloc/presentation/random_images_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    RandomImagePage(),
    GalleryImagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          color: Colors.blueAccent,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          index == 0
              ? context
                  .read<RandomImageBloc>()
                  .add(RandomImageEvent.init(RandomCategory().elementRandom))
              : context
                  .read<SearchImageBloc>()
                  .add(SearchImageEvent.init(RandomCategory().elementRandom));
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: StringsApp.randomTitleBar,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: StringsApp.findImageTitleBar,
          ),
        ],
      ),
    );
  }
}
