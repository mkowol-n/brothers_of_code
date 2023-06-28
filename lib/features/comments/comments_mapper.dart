import 'package:brothers_of_code/core/dtos/comment_response_dto.dart';
import 'package:brothers_of_code/features/comments/models/comment_model.dart';

extension CommentMapper on CommentResponseDto {
  CommentModel toDomain() {
    return CommentModel(postId: postId, id: id, name: name, email: email, body: body);
  }
}