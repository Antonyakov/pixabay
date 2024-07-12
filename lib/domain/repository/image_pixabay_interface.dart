import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';

abstract class ImageRepositoryInterface {
  Future<List<ImagePixabay>> getRandomImages(String element);

  Future<List<ImagePixabay>> getImagesWithQuery(String query);
}
