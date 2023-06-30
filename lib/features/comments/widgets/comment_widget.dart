import 'package:brothers_of_code/features/comments/models/comment_model.dart';
import 'package:flutter/material.dart';

import '../../../coreui/base_text_view.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.commentModel,
  });

  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseTextView(
            commentModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textStyle: const TextStyle(
              fontSize: 24
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          BaseTextView(
            commentModel.email,
            textStyle: const TextStyle(
                fontSize: 18
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BaseTextView(commentModel.body),
        ],
      ),
    );
  }
}
