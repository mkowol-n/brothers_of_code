import 'package:brothers_of_code/core/network/api_provider.dart';

import '../../../../core/mapper/mapper.dart';
import '../../domain/model/gallery_model.dart';
import '../../domain/repository/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final ApiProvider _apiProvider;
  final Mappr _mappr;

  GalleryRepositoryImpl(this._apiProvider, this._mappr);

  @override
  Future<List<GalleryModel>> getImages() async {
    final response = await _apiProvider.getGallery();
    return _mappr.convertList(response);
  }
}