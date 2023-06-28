import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/state/request_state.dart';
import '../../../coreui/screen_states/full_screen_state_handler.dart';
import 'gallery_state_provider.dart';

class GalleryScreen extends ConsumerWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RequestState<String> state = ref.watch(galleryProvider);
    final notifier = ref.read(galleryProvider.notifier);

    return FullScreenStateHandler(
      dataWidget: (data) {
        return Text(data);
      },
      onRetry: notifier.getImages,
      state: state,
    );
  }
}
