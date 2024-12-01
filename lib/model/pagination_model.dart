import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
class PaginationModel with _$PaginationModel {
  factory PaginationModel({
    required int id,
    required String title,
    required String content,
    required List<ImageUrl> imageUrl,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

@freezed
class ImageUrl with _$ImageUrl {
  factory ImageUrl({
    required int id,
    required String url,
  }) = _ImageUrl;

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);
}
