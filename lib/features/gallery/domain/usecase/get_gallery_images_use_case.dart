
import '../model/gallery_model.dart';

abstract class GetGalleryImagesUseCase {
  Future<List<GalleryModel>> call();
}