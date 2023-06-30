import 'package:brothers_of_code/coreui/screen_states/full_screen_state_handler.dart';
import 'package:brothers_of_code/features/comments/comments_state_notifier.dart';
import 'package:brothers_of_code/features/comments/widgets/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentsScreen extends ConsumerWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commentsProvider);
    final notifier = ref.read(commentsProvider.notifier);
    return FullScreenStateHandler(
      state: state,
      dataWidget: (data) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemBuilder: (context, index) {
            final item = data[index];
            return CommentWidget(
              commentModel: item,
            );
          },
          itemCount: data.length,
        );
      },
      onRetry: notifier.getComments,
    );
  }
}
