
import '../../../../core/source/source_type.dart';
import '../model/gallery_model.dart';

abstract class GetGalleryImagesUseCase {
  Future<List<GalleryModel>> call(SourceType type);
}