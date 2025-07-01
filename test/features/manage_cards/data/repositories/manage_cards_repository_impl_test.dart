import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// Mock for the [ManageCardsLocalDataSource] to isolate the repository.
class MockManageCardsLocalDataSource extends Mock
    implements ManageCardsLocalDataSource {}

/// Mock for the [CardModel] entity.
// ignore: avoid_implementing_value_types
class MockCardModel extends Mock implements CardModel {}

// ignore: avoid_implementing_value_types
class MockCardEntity extends Mock implements CardEntity {}

class FakeCardModel extends Fake implements CardModel {}

void main() {
  /// Test suite for the [ManageCardsRepositoryImpl].
  group('ManageCardsRepositoryImpl', () {
    late ManageCardsRepositoryImpl repository;
    late MockManageCardsLocalDataSource mockLocalDataSource;
    final tCardEntity = MockCardEntity();
    final tCardModel = MockCardModel();

    setUpAll(() {
      registerFallbackValue(FakeCardModel());
    });

    setUp(() {
      mockLocalDataSource = MockManageCardsLocalDataSource();
      repository =
          ManageCardsRepositoryImpl(localDataSource: mockLocalDataSource);

      // Stub the toEntity method
      when(() => tCardModel.toEntity()).thenReturn(tCardEntity);
    });

    /// Tests for the [createCard] method.
    group('createCard', () {
      /// Test case for successful card creation.
      test(
        'should return success when local data source creates card successfully',
        () async {
          // Arrange
          when(() => mockLocalDataSource.createCard(any()))
              .thenAnswer((_) async => Future.value());

          // Act
          final result = await repository.createCard(tCardEntity);

          // Assert
          expect(result, equals(const Right(null)));
          verify(() => mockLocalDataSource.createCard(any())).called(1);
        },
      );

      /// Test case for handling failure during card creation.
      test(
        'should return failure when local data source throws an exception',
        () async {
          // Arrange
          when(() => mockLocalDataSource.createCard(any()))
              .thenThrow(CacheException());

          // Act
          final result = await repository.createCard(tCardEntity);

          // Assert
          expect(result, equals(Left(CacheFailure())));
          verify(() => mockLocalDataSource.createCard(any())).called(1);
        },
      );
    });

    /// Tests for the [getCards] method.
    group('getCards', () {
      final tCardsList = [tCardModel];
      final tCardEntityList = [tCardEntity];

      /// Test case for successful card fetching.
      test(
        'should return a list of cards when local data source is successful',
        () async {
          // Arrange
          when(() => mockLocalDataSource.getCards())
              .thenAnswer((_) async => tCardsList);

          // Act
          final result = await repository.getCards();

          // Assert
          expect(result, equals(Right(tCardEntityList)));
          verify(() => mockLocalDataSource.getCards()).called(1);
        },
      );

      /// Test case for handling failure during card fetching.
      test(
        'should return failure when local data source throws an exception',
        () async {
          // Arrange
          when(() => mockLocalDataSource.getCards())
              .thenThrow(CacheException());

          // Act
          final result = await repository.getCards();

          // Assert
          expect(result, equals(Left(CacheFailure())));
          verify(() => mockLocalDataSource.getCards()).called(1);
        },
      );
    });
  });
}
