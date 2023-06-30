
import '../model/gallery_model.dart';

abstract class GalleryRepository {
  Future<List<GalleryModel>> getImages();
}