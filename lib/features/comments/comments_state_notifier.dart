import 'package:brothers_of_code/core/source/source_type.dart';
import 'package:brothers_of_code/core/state/base_state_notifier.dart';
import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:brothers_of_code/features/comments/comments_repository.dart';
import 'package:brothers_of_code/features/comments/models/comment_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentsStateNotifier
    extends BaseStateNotifier<RequestState<List<CommentModel>>> {
  CommentsStateNotifier(this._commentsRepository)
      : super(const RequestState.initial());

  final CommentsRepository _commentsRepository;

  Future<void> getComments() async {
    await asyncAction(() async {
      return _commentsRepository.getComments(SourceType.remoteThenLocal);
    }).execute((requestState) => requestState);
  }
}

final commentsProvider = StateNotifierProvider<CommentsStateNotifier, RequestState<List<CommentModel>>>((ref) {
  return CommentsStateNotifier(ref.read(commentsRepositoryProvider))..getComments();
});
