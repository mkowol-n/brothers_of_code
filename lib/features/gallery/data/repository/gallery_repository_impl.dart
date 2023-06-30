
import 'package:brothers_of_code/core/network/api_provider.dart';
import 'package:brothers_of_code/features/gallery/gallery_mapper.dart';

import '../../domain/model/gallery_model.dart';
import '../../domain/repository/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final ApiProvider _apiProvider;

  GalleryRepositoryImpl(this._apiProvider);

  @override
  Future<List<GalleryModel>> getImages() async {
    final response = await _apiProvider.getGallery();
    return response.map((e) => e.toDomain()).toList();
  }
}