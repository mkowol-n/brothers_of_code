import 'package:brothers_of_code/core/source/local/mock_database_dao.dart';
import 'package:brothers_of_code/core/source/source_decider.dart';
import 'package:brothers_of_code/core/source/source_type.dart';
import 'package:brothers_of_code/features/comments/models/comment_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/di/core_di.dart';
import '../../core/mapper/mapper.dart';
import '../../core/source/remote/api_provider.dart';

class CommentsRepository {
  final ApiProvider _apiProvider;
  final Mappr _mappr;
  final MockDatabaseDao _dao;

  CommentsRepository(this._apiProvider, this._mappr, this._dao);

  Future<List<CommentModel>> getComments(SourceType type) async {
    final response = await sourceDecider(
      remote: _apiProvider.getComments,
      local: _dao.getComments,
      type: type,
      saveRemoteResponse: _dao.saveComments,
    );
    return _mappr.convertList(response);
  }
}

final commentsRepositoryProvider = Provider<CommentsRepository>((ref) {
  return CommentsRepository(ref.read(apiProvider), ref.read(mapperProvider), ref.read(mockDAO));
});
