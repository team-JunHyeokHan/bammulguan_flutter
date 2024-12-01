import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';  // freezed 코드 생성을 위한 파일
part 'pagination_model.g.dart';  // json_serializable 코드 생성을 위한 파일

@freezed
class PaginationModel with _$PaginationModel {
  factory PaginationModel({
    required int id,
    required String title,
    required String content,
    required List<ImageUrl> imageUrl, // 이미지 URL을 포함한 모델
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);  // json에서 객체로 변환하는 메소드
}

@freezed
class ImageUrl with _$ImageUrl {
  factory ImageUrl({
    required int id,
    required String url,
  }) = _ImageUrl;

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);  // json에서 객체로 변환하는 메소드
}
