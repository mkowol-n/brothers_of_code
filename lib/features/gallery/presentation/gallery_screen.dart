import 'package:auto_route/auto_route.dart';
import 'package:brothers_of_code/core/autorouter/app_router.dart';
import 'package:brothers_of_code/coreui/base_image_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../coreui/screen_states/full_screen_state_handler.dart';
import '../di/gallery_feature_di.dart';

class GalleryScreen extends ConsumerWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(galleryProvider);
    final notifier = ref.read(galleryProvider.notifier);

    return FullScreenStateHandler(
      dataWidget: (data) {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              maxCrossAxisExtent: 300),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return InkWell(
              child: BaseImageView(src: item.thumbnailUrl),
              onTap: () {
                context.pushRoute(
                  SingleImageDialogRoute(photo: item),
                );
              },
            );
          },
        );
      },
      onRetry: notifier.getImages,
      state: state,
    );
  }
}
