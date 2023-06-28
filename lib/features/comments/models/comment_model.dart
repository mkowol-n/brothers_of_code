import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';

@freezed
class CommentModel with _$CommentModel {
  factory CommentModel({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _CommentModel;
}