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

void main() {
  /// Test suite for the [GetCards] use case.
  group('GetCards', () {
    late GetCards usecase;
    late MockManageCardsRepository mockManageCardsRepository;

    setUp(() {
      mockManageCardsRepository = MockManageCardsRepository();
      usecase = GetCards(mockManageCardsRepository);
    });

    final tCardsList = <CardEntity>[];
    final tFailure = ServerFailure();

    /// Test to ensure that the use case successfully calls the repository's
    /// [getCards] method and returns a list of cards.
    test(
      'should call repository.getCards and return a list of cards',
      () async {
        // Arrange
        when(() => mockManageCardsRepository.getCards())
            .thenAnswer((_) async => Right(tCardsList));

        // Act
        final result = await usecase(NoParams());

        // Assert
        expect(result, Right(tCardsList));
        verify(() => mockManageCardsRepository.getCards()).called(1);
        verifyNoMoreInteractions(mockManageCardsRepository);
      },
    );

    /// Test to ensure that the use case returns a [Failure] when the
    /// repository call is unsuccessful.
    test('should return a failure when repository call fails', () async {
      // Arrange
      when(() => mockManageCardsRepository.getCards())
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockManageCardsRepository.getCards()).called(1);
      verifyNoMoreInteractions(mockManageCardsRepository);
    });
  });
}
