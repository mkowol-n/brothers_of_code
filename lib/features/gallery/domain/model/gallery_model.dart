import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_model.freezed.dart';

@freezed
class GalleryModel with _$GalleryModel {
  factory GalleryModel({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _GalleryModel;
}