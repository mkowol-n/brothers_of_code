import 'package:brothers_of_code/core/dtos/comment_response_dto.dart';
import 'package:brothers_of_code/core/dtos/gallery_response_dto.dart';

class MockDatabaseDao {
  List<CommentResponseDto> _commentsEntities = [];
  List<GalleryResponseDto> _galleryEntities = [];

  Future<void> saveComments(List<CommentResponseDto> entities) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _commentsEntities = entities;
  }

  Future<void> saveGallery(List<GalleryResponseDto> entities) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _galleryEntities = entities;
  }

  Future<List<CommentResponseDto>> getComments() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _commentsEntities;
  }

  Future<List<GalleryResponseDto>> getGallery() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _galleryEntities;
  }
}