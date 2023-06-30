import 'dart:async';

import 'package:brothers_of_code/core/source/source_type.dart';
import 'package:brothers_of_code/core/state/base_state_notifier.dart';
import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:brothers_of_code/features/gallery/domain/usecase/get_gallery_images_use_case.dart';

import '../domain/model/gallery_model.dart';

class GalleryStateNotifier extends BaseStateNotifier<RequestState<List<GalleryModel>>> {
  final GetGalleryImagesUseCase _useCase;

  GalleryStateNotifier(this._useCase) : super(const RequestState.initial());

  Future<void> getImages() async {
    await asyncAction(() async {
      return await _useCase(SourceType.remoteThenLocal);
    }).execute((requestState) => requestState);
  }
}
