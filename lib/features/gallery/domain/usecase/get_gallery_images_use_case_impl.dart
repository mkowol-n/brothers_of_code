
import 'package:brothers_of_code/features/gallery/domain/repository/gallery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/gallery_model.dart';
import 'get_gallery_images_use_case.dart';

@Riverpod()
class GetGalleryImagesUseCaseImpl implements GetGalleryImagesUseCase {
  final GalleryRepository galleryRepository;

  GetGalleryImagesUseCaseImpl(this.galleryRepository);

  @override
  Future<List<GalleryModel>> call() async {
    return await galleryRepository.getImages();
  }
}

