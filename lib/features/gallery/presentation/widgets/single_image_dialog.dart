import 'package:auto_route/annotations.dart';
import 'package:brothers_of_code/coreui/base_dialog.dart';
import 'package:brothers_of_code/coreui/base_image_view.dart';
import 'package:brothers_of_code/features/gallery/domain/model/gallery_model.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SingleImageDialogRoute')
class SingleImageDialog extends StatelessWidget {
  const SingleImageDialog({super.key, required this.photo});

  final GalleryModel photo;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: BaseImageView(
        src: photo.url,
        placeholder: const SizedBox(
          height: 600,
          width: 600,
        ),
      ),
    );
  }
}
