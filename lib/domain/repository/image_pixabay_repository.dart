import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/domain/repository/image_pixabay_interface.dart';

class ImageRepository implements ImageRepositoryInterface {
  static const apiKey = '24463472-c89a1e2a8e18efee63b2f6c40';
  static const baseUrl = 'https://pixabay.com/api/';

  @override
  Future<List<ImagePixabay>> getRandomImages(String element) async {
    var url = baseUrl +
        '?key=$apiKey&q=$element?per_page=100&editors_choice=true&orientation=vertical&image_type=photo';
    try {
      final response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> imageJson = data['hits'];
        final List<ImagePixabay> images =
            imageJson.map((i) => ImagePixabay.fromJson(i)).toList();
        return images;
      }
    } catch (e) {
      throw Exception();
    }
    throw UnimplementedError();
  }

  @override
  Future<List<ImagePixabay>> getImagesWithQuery(String query) async {
    var url = baseUrl +
        '?key=$apiKey&q=$query&per_page=100&editors_choice=true&orientation=vertical&image_type=photo';
    try {
      final response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> imageJson = data['hits'];
        final List<ImagePixabay> images =
            imageJson.map((i) => ImagePixabay.fromJson(i)).toList();
        return images;
      }
    } catch (e) {
      throw Exception();
    }
    throw UnimplementedError();
  }
}
