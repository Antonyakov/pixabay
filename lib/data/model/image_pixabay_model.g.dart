// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_pixabay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImagePixabayImpl _$$ImagePixabayImplFromJson(Map<String, dynamic> json) =>
    _$ImagePixabayImpl(
      largeImageURL: json['largeImageURL'] as String?,
      webFormatHeight: (json['webformatHeight'] as num?)?.toInt(),
      webFormatWidth: (json['webformatWidth'] as num?)?.toInt(),
      likes: (json['likes'] as num?)?.toInt(),
      imageWidth: (json['imageWidth'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      views: (json['views'] as num?)?.toInt(),
      comments: (json['comments'] as num?)?.toInt(),
      pageURL: json['pageURL'] as String?,
      imageHeight: (json['imageHeight'] as num?)?.toInt(),
      webFormatURL: json['webformatURL'] as String?,
      type: json['type'] as String?,
      previewHeight: (json['previewHeight'] as num?)?.toInt(),
      tags: json['tags'] as String?,
      downloads: (json['downloads'] as num?)?.toInt(),
      user: json['user'] as String?,
      favorites: (json['favorites'] as num?)?.toInt(),
      imageSize: (json['imageSize'] as num?)?.toInt(),
      previewWidth: (json['previewWidth'] as num?)?.toInt(),
      userImageURL: json['userImageURL'] as String?,
      previewURL: json['previewURL'] as String?,
    );

Map<String, dynamic> _$$ImagePixabayImplToJson(_$ImagePixabayImpl instance) =>
    <String, dynamic>{
      'largeImageURL': instance.largeImageURL,
      'webformatHeight': instance.webFormatHeight,
      'webformatWidth': instance.webFormatWidth,
      'likes': instance.likes,
      'imageWidth': instance.imageWidth,
      'id': instance.id,
      'userId': instance.userId,
      'views': instance.views,
      'comments': instance.comments,
      'pageURL': instance.pageURL,
      'imageHeight': instance.imageHeight,
      'webformatURL': instance.webFormatURL,
      'type': instance.type,
      'previewHeight': instance.previewHeight,
      'tags': instance.tags,
      'downloads': instance.downloads,
      'user': instance.user,
      'favorites': instance.favorites,
      'imageSize': instance.imageSize,
      'previewWidth': instance.previewWidth,
      'userImageURL': instance.userImageURL,
      'previewURL': instance.previewURL,
    };
