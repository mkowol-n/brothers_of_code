
import 'package:brothers_of_code/core/dtos/comment_response_dto.dart';
import 'package:brothers_of_code/core/dtos/gallery_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_provider.g.dart';

@RestApi()
abstract class ApiProvider {

  factory ApiProvider(Dio dio) = _ApiProvider;

  @GET('/photos')
  Future<List<GalleryResponseDto>> getGallery();

  @GET('/comments')
  Future<List<CommentResponseDto>> getComments();
}