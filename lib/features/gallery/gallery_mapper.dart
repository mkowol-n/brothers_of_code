import 'package:brothers_of_code/core/dtos/gallery_response_dto.dart';
import 'package:brothers_of_code/features/gallery/domain/model/gallery_model.dart';

extension GalleryMapper on GalleryResponseDto {
  GalleryModel toDomain() {
    return GalleryModel(albumId: albumId, id: id, title: title, url: url, thumbnailUrl: thumbnailUrl);
  }
}