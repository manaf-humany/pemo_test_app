import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// Mock for the [ManageCardsRepository] to isolate the use case during testing.
class MockManageCardsRepository extends Mock implements ManageCardsRepository {}

/// Mock for the [CardModel] entity.
// ignore: avoid_implementing_value_types
class MockCardModel extends Mock implements CardModel {}

// ignore: avoid_implementing_value_types
class MockCardEntity extends Mock implements CardEntity {}

// ignore: avoid_implementing_value_types
class FakeCardEntity extends Fake implements CardEntity {}

void main() {
  /// Test suite for the [CreateCard] use case.
  group('CreateCard', () {
    late CreateCard usecase;
    late MockManageCardsRepository mockManageCardsRepository;
    final tCardEntity = MockCardEntity();

    setUpAll(() {
      registerFallbackValue(FakeCardEntity());
    });

    setUp(() {
      mockManageCardsRepository = MockManageCardsRepository();
      usecase = CreateCard(mockManageCardsRepository);
    });

    final tCard = MockCardModel();

    // Stub the toEntity method to return our mock entity
    setUp(() {
      when(() => tCard.toEntity()).thenReturn(tCardEntity);
    });

    final tFailure = ServerFailure();

    /// Test to ensure that the use case successfully calls the repository's
    /// [createCard] method and completes without error.
    test(
      'should call repository.createCard and complete successfully',
      () async {
        // Arrange
        when(() => mockManageCardsRepository.createCard(any()))
            .thenAnswer((_) async => const Right(null));

        // Act
        final result = await usecase(CreateCardParams(card: tCardEntity));

        // Assert
        expect(result, const Right(null));
        verify(() => mockManageCardsRepository.createCard(tCardEntity))
            .called(1);
        verifyNoMoreInteractions(mockManageCardsRepository);
      },
    );

    /// Test to ensure that the use case returns a [Failure] when the
    /// repository call is unsuccessful.
    test('should return a failure when repository call fails', () async {
      // Arrange
      when(() => mockManageCardsRepository.createCard(any()))
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase(CreateCardParams(card: tCardEntity));

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockManageCardsRepository.createCard(tCardEntity)).called(1);
      verifyNoMoreInteractions(mockManageCardsRepository);
    });
  });
}
