import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:brothers_of_code/features/gallery/domain/model/gallery_model.dart';
import 'package:brothers_of_code/features/gallery/domain/usecase/get_gallery_images_use_case.dart';
import 'package:brothers_of_code/features/gallery/presentation/gallery_state_notifier.dart';
import 'package:mocktail/mocktail.dart';

import 'state_test.dart';

class MockUploadedDocumentsDao extends Mock
    implements GetGalleryImagesUseCase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  final mockUseCase = MockUploadedDocumentsDao();
  stateTest(
    'when useCase call succeed then success state will be returned',
    stateProvider: GalleryStateNotifier(mockUseCase),
    act: (provider) => provider.getImages(),
    expectedStates: (RequestState<List<GalleryModel>> state) => [
      state is Initial,
      state is Loading,
      state is Data && state().isEmpty,
    ],
    when: [
      () => when(mockUseCase)
          .thenAnswer((invocation) async => List<GalleryModel>.empty())
    ],
    verify: [
      () => verify(mockUseCase).called(1),
    ],
  );
}
