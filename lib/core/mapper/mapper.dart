import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:brothers_of_code/core/dtos/gallery_response_dto.dart';
import 'package:brothers_of_code/features/comments/models/comment_model.dart';
import 'package:brothers_of_code/features/gallery/domain/model/gallery_model.dart';

import '../dtos/comment_response_dto.dart';

part 'mapper.g.dart';

@AutoMappr([
  MapType<GalleryResponseDto, GalleryModel>(),
  MapType<CommentResponseDto, CommentModel>(),
])
class Mappr extends $Mappr {}
