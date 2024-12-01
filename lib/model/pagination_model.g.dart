// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationModelImpl _$$PaginationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: (json['imageUrl'] as List<dynamic>)
          .map((e) => ImageUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginationModelImplToJson(
        _$PaginationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
    };

_$ImageUrlImpl _$$ImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$ImageUrlImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ImageUrlImplToJson(_$ImageUrlImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
