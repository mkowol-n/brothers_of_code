
import 'package:brothers_of_code/core/di/core_di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/repository/gallery_repository_impl.dart';
import '../domain/repository/gallery_repository.dart';
import '../domain/usecase/get_gallery_images_use_case_impl.dart';
import '../domain/usecase/get_gallery_images_use_case.dart';

final galleryRepositoryProvider = Provider<GalleryRepository>((ref) {
  return GalleryRepositoryImpl(ref.read(apiProvider));
});

final galleryUseCaseProvider = AutoDisposeProvider<GetGalleryImagesUseCase>((ref) {
  return GetGalleryImagesUseCaseImpl(ref.read(galleryRepositoryProvider));
});