import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_response_dto.freezed.dart';
part 'gallery_response_dto.g.dart';

@freezed
class GalleryResponseDto with _$GalleryResponseDto {
  factory GalleryResponseDto({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _GalleryResponseDto;

  factory GalleryResponseDto.fromJson(Map<String, Object?> json)
  => _$GalleryResponseDtoFromJson(json);
}