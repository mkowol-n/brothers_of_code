import 'package:brothers_of_code/core/source/remote/api_provider.dart';
import 'package:brothers_of_code/core/source/source_type.dart';

import '../../../../core/mapper/mapper.dart';
import '../../../../core/source/local/mock_database_dao.dart';
import '../../../../core/source/source_decider.dart';
import '../../domain/model/gallery_model.dart';
import '../../domain/repository/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final ApiProvider _apiProvider;
  final Mappr _mappr;
  final MockDatabaseDao _dao;

  GalleryRepositoryImpl(this._apiProvider, this._mappr, this._dao);

  @override
  Future<List<GalleryModel>> getImages(SourceType type) async {
    final response = await sourceDecider(
      remote: _apiProvider.getGallery,
      local: _dao.getGallery,
      type: type,
      saveRemoteResponse: _dao.saveGallery,
    );
    return _mappr.convertList(response);
  }
}
