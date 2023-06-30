
import '../../../../core/source/source_type.dart';
import '../model/gallery_model.dart';

abstract class GalleryRepository {
  Future<List<GalleryModel>> getImages(SourceType type);
}