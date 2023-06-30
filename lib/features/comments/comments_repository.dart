import 'package:brothers_of_code/features/comments/models/comment_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/di/core_di.dart';
import '../../core/mapper/mapper.dart';
import '../../core/network/api_provider.dart';

class CommentsRepository {

  final ApiProvider _apiProvider;
  final Mappr _mappr;

  CommentsRepository(this._apiProvider, this._mappr);

  Future<List<CommentModel>> getComments() async {
    final response = await _apiProvider.getComments();
    return _mappr.convertList(response);
  }
}

final commentsRepositoryProvider = Provider<CommentsRepository>((ref) {
  return CommentsRepository(ref.read(apiProvider), ref.read(mapperProvider));
});
