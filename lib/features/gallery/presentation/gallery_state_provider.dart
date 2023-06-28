import 'dart:async';

import 'package:brothers_of_code/core/state/base_state_notifier.dart';
import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:brothers_of_code/features/gallery/domain/usecase/get_gallery_images_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../di/gallery_feature_di.dart';

class GalleryStateProvider extends BaseStateNotifier<RequestState<String>> {
  final GetGalleryImagesUseCase _useCase;

  GalleryStateProvider(this._useCase) : super(const RequestState.initial());

  Future<void> getImages() async {
    await asyncAction(() async {
      return await _useCase();
    }).execute((requestState) => requestState);
  }
}

final galleryProvider = StateNotifierProvider<GalleryStateProvider, RequestState<String>>((ref) {
  return GalleryStateProvider(ref.read(galleryUseCaseProvider))..getImages();
});