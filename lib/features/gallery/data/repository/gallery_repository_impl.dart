
import 'package:brothers_of_code/core/network/api_provider.dart';

import '../../domain/repository/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final ApiProvider _apiProvider;

  GalleryRepositoryImpl(this._apiProvider);

  @override
  Future<String> getImages() async {
    final response = await _apiProvider.getGallery();
    await Future.delayed(const Duration(seconds: 5));
    return response.first.title;
  }
}