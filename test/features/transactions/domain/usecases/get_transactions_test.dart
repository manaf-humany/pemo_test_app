import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// Mock for the [TransactionsRepository] to isolate the use case during testing.
class MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

/// Mock for the [TransactionsEntity] entity.
// ignore: avoid_implementing_value_types
class MockTransactionsEntity extends Mock implements TransactionsEntity {}

void main() {
  /// Test suite for the [GetTransactions] use case.
  group('GetTransactions', () {
    late GetTransactions usecase;
    late MockTransactionsRepository mockTransactionsRepository;

    setUp(() {
      mockTransactionsRepository = MockTransactionsRepository();
      usecase = GetTransactions(mockTransactionsRepository);
    });

    final tTransactionsEntity = MockTransactionsEntity();
    final tFailure = ServerFailure();

    /// Test to ensure that the use case successfully calls the repository's
    /// [getTransactions] method and returns a [TransactionsEntity].
    test(
      'should get transactions from the repository',
      () async {
        // Arrange
        when(() => mockTransactionsRepository.getTransactions())
            .thenAnswer((_) async => Right(tTransactionsEntity));

        // Act
        final result = await usecase(NoParams());

        // Assert
        expect(result, Right(tTransactionsEntity));
        verify(() => mockTransactionsRepository.getTransactions());
        verifyNoMoreInteractions(mockTransactionsRepository);
      },
    );

    /// Test to ensure that the use case handles failures from the repository
    /// and returns a [Failure].
    test(
      'should return a Failure when the repository call fails',
      () async {
        // Arrange
        when(() => mockTransactionsRepository.getTransactions())
            .thenAnswer((_) async => Left(tFailure));

        // Act
        final result = await usecase(NoParams());

        // Assert
        expect(result, Left(tFailure));
        verify(() => mockTransactionsRepository.getTransactions());
        verifyNoMoreInteractions(mockTransactionsRepository);
      },
    );
  });
}
