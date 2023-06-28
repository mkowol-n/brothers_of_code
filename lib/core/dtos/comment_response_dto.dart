import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response_dto.freezed.dart';
part 'comment_response_dto.g.dart';

@freezed
class CommentResponseDto with _$CommentResponseDto {
  factory CommentResponseDto({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _CommentResponseDto;

  factory CommentResponseDto.fromJson(Map<String, Object?> json)
  => _$CommentResponseDtoFromJson(json);
}