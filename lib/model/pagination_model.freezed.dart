// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<ImageUrl> get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call({int id, String title, String content, List<ImageUrl> imageUrl});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<ImageUrl>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl value,
          $Res Function(_$PaginationModelImpl) then) =
      __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String content, List<ImageUrl> imageUrl});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
      _$PaginationModelImpl _value, $Res Function(_$PaginationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
  }) {
    return _then(_$PaginationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<ImageUrl>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl implements _PaginationModel {
  _$PaginationModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      required final List<ImageUrl> imageUrl})
      : _imageUrl = imageUrl;

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  final List<ImageUrl> _imageUrl;
  @override
  List<ImageUrl> get imageUrl {
    if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrl);
  }

  @override
  String toString() {
    return 'PaginationModel(id: $id, title: $title, content: $content, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content,
      const DeepCollectionEquality().hash(_imageUrl));

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationModel implements PaginationModel {
  factory _PaginationModel(
      {required final int id,
      required final String title,
      required final String content,
      required final List<ImageUrl> imageUrl}) = _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  List<ImageUrl> get imageUrl;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) {
  return _ImageUrl.fromJson(json);
}

/// @nodoc
mixin _$ImageUrl {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this ImageUrl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageUrlCopyWith<ImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUrlCopyWith<$Res> {
  factory $ImageUrlCopyWith(ImageUrl value, $Res Function(ImageUrl) then) =
      _$ImageUrlCopyWithImpl<$Res, ImageUrl>;
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class _$ImageUrlCopyWithImpl<$Res, $Val extends ImageUrl>
    implements $ImageUrlCopyWith<$Res> {
  _$ImageUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageUrlImplCopyWith<$Res>
    implements $ImageUrlCopyWith<$Res> {
  factory _$$ImageUrlImplCopyWith(
          _$ImageUrlImpl value, $Res Function(_$ImageUrlImpl) then) =
      __$$ImageUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class __$$ImageUrlImplCopyWithImpl<$Res>
    extends _$ImageUrlCopyWithImpl<$Res, _$ImageUrlImpl>
    implements _$$ImageUrlImplCopyWith<$Res> {
  __$$ImageUrlImplCopyWithImpl(
      _$ImageUrlImpl _value, $Res Function(_$ImageUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$ImageUrlImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageUrlImpl implements _ImageUrl {
  _$ImageUrlImpl({required this.id, required this.url});

  factory _$ImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageUrlImplFromJson(json);

  @override
  final int id;
  @override
  final String url;

  @override
  String toString() {
    return 'ImageUrl(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUrlImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      __$$ImageUrlImplCopyWithImpl<_$ImageUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageUrlImplToJson(
      this,
    );
  }
}

abstract class _ImageUrl implements ImageUrl {
  factory _ImageUrl({required final int id, required final String url}) =
      _$ImageUrlImpl;

  factory _ImageUrl.fromJson(Map<String, dynamic> json) =
      _$ImageUrlImpl.fromJson;

  @override
  int get id;
  @override
  String get url;

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
