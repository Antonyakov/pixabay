import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_pixabay_model.freezed.dart';

part 'image_pixabay_model.g.dart';

@freezed
class ImagePixabay with _$ImagePixabay {
  factory ImagePixabay({
    String? largeImageURL,
    @JsonKey(name: 'webformatHeight') int? webFormatHeight,
    @JsonKey(name: 'webformatWidth') int? webFormatWidth,
    int? likes,
    int? imageWidth,
    int? id,
    int? userId,
    int? views,
    int? comments,
    String? pageURL,
    int? imageHeight,
    @JsonKey(name: 'webformatURL') String? webFormatURL,
    String? type,
    int? previewHeight,
    String? tags,
    int? downloads,
    String? user,
    int? favorites,
    int? imageSize,
    int? previewWidth,
    String? userImageURL,
    String? previewURL,
  }) = _ImagePixabay;

  factory ImagePixabay.fromJson(Map<String, dynamic> json) =>
      _$ImagePixabayFromJson(json);
}
