import 'package:brothers_of_code/features/comments/comments_mapper.dart';
import 'package:brothers_of_code/features/comments/models/comment_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/di/core_di.dart';
import '../../core/network/api_provider.dart';

class CommentsRepository {

  final ApiProvider _apiProvider;

  CommentsRepository(this._apiProvider);

  Future<List<CommentModel>> getComments() async {
    final response = await _apiProvider.getComments();
    return response.map((e) => e.toDomain()).toList();
  }
}

final commentsRepositoryProvider = Provider<CommentsRepository>((ref) {
  return CommentsRepository(ref.read(apiProvider));
});
