import 'package:brothers_of_code/core/di/core_di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/state/request_state.dart';
import '../data/repository/gallery_repository_impl.dart';
import '../domain/model/gallery_model.dart';
import '../domain/repository/gallery_repository.dart';
import '../domain/usecase/get_gallery_images_use_case_impl.dart';
import '../domain/usecase/get_gallery_images_use_case.dart';
import '../presentation/gallery_state_notifier.dart';

final galleryRepositoryProvider = Provider<GalleryRepository>((ref) {
  return GalleryRepositoryImpl(ref.read(apiProvider), ref.read(mapperProvider), ref.read(mockDAO));
});

final galleryUseCaseProvider =
    AutoDisposeProvider<GetGalleryImagesUseCase>((ref) {
  return GetGalleryImagesUseCaseImpl(ref.read(galleryRepositoryProvider));
});

final galleryProvider = StateNotifierProvider<GalleryStateNotifier,
    RequestState<List<GalleryModel>>>((ref) {
  return GalleryStateNotifier(ref.read(galleryUseCaseProvider))..getImages();
});
