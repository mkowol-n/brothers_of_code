import 'package:brothers_of_code/core/source/source_type.dart';
import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:brothers_of_code/features/gallery/domain/model/gallery_model.dart';
import 'package:brothers_of_code/features/gallery/domain/usecase/get_gallery_images_use_case.dart';
import 'package:brothers_of_code/features/gallery/presentation/gallery_state_notifier.dart';
import 'package:mocktail/mocktail.dart';

import 'state_test_helper.dart';

class MockUploadedDocumentsDao extends Mock
    implements GetGalleryImagesUseCase {}

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
      () => when(() => mockUseCase.call(SourceType.remoteThenLocal))
          .thenAnswer((invocation) async => List<GalleryModel>.empty())
    ],
    verify: [
      () => verify(() => mockUseCase.call(SourceType.remoteThenLocal)).called(1),
    ],
  );
}
