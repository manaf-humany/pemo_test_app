import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// Mock for the [GetTransactions] use case to isolate the cubit during testing.
class MockGetTransactions extends Mock implements GetTransactions {}

/// Mock for the [Transactions] entity.
// ignore: avoid_implementing_value_types
class MockTransactions extends Mock implements TransactionsEntity {}

// ignore: avoid_implementing_value_types
class FakeNoParams extends Fake implements NoParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeNoParams());
  });

  /// Test suite for the [TransactionCubit].
  group('TransactionCubit', () {
    late TransactionCubit transactionCubit;
    late MockGetTransactions mockGetTransactions;

    setUp(() {
      mockGetTransactions = MockGetTransactions();
      transactionCubit = TransactionCubit(getTransactions: mockGetTransactions);
    });

    /// Test to ensure the initial state of the cubit is correct.
    test('initial state is TransactionState.initial()', () {
      expect(transactionCubit.state, const TransactionState.initial());
    });

    /// Tests for the [fetchTransactions] method.
    group('fetchTransactions', () {
      final tTransactions = MockTransactions();
      final tFailure = ServerFailure();

      /// Test case for successful transaction fetching.
      blocTest<TransactionCubit, TransactionState>(
        'emits [loading, loaded] when getTransactions is successful',
        setUp: () {
          when(() => tTransactions.transactions).thenReturn([]);
          when(() => mockGetTransactions(any()))
              .thenAnswer((_) async => Right(tTransactions));
        },
        build: () => transactionCubit,
        act: (cubit) => cubit.fetchTransactions(),
        expect: () => [
          const TransactionState.loading(),
          TransactionState.loaded(tTransactions.transactions),
        ],
        verify: (_) {
          verify(() => mockGetTransactions(NoParams())).called(1);
        },
      );

      /// Test case for handling failure during transaction fetching.
      blocTest<TransactionCubit, TransactionState>(
        'emits [loading, error] when getTransactions fails',
        setUp: () {
          when(() => mockGetTransactions(any()))
              .thenAnswer((_) async => Left(tFailure));
        },
        build: () => transactionCubit,
        act: (cubit) => cubit.fetchTransactions(),
        expect: () => [
          const TransactionState.loading(),
          TransactionState.error(tFailure.toString()),
        ],
        verify: (_) {
          verify(() => mockGetTransactions(NoParams())).called(1);
        },
      );
    });
  });
}
