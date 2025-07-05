// ignore_for_file: avoid_implementing_value_types

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// A mock implementation of the [GetTransactionDetails] use case.
class MockGetTransactionDetails extends Mock implements GetTransactionDetails {}

/// A fake implementation of [GetTransactionDetailsParams] for testing purposes.
class FakeGetTransactionDetailsParams extends Fake
    implements GetTransactionDetailsParams {}

/// The main function for running tests related to [TransactionDetailsCubit].
/// It sets up the necessary mocks and defines test groups.
void main() {
  /// The [TransactionDetailsCubit] instance being tested.
  late TransactionDetailsCubit cubit;
  late MockGetTransactionDetails mockGetTransactionDetails;
  setUpAll(() {
    registerFallbackValue(
      FakeGetTransactionDetailsParams(),
    );
  });

  /// Sets up the test environment before each test.
  setUp(() {
    mockGetTransactionDetails = MockGetTransactionDetails();
    cubit = TransactionDetailsCubit(
      getTransactionDetails: mockGetTransactionDetails,
    );
  });

  const tTransactionId = '1';
  final tTransactionDetailsEntity = const TransactionDetailsEntity(
    id: '1',
    name: 'Grocery Shopping',
    date: 1625142600,
    merchant: 'SuperMart',
    billingAmount: 45.75,
    image: 'https://example.com/grocery.png',
    billingCurrency: 'USD',
  );

  /// Test group for [TransactionDetailsCubit].
  group('TransactionDetailsCubit', () {
    /// Test case to verify the initial state of the cubit.
    test('initial state should be TransactionDetailsState.initial()', () {
      expect(cubit.state, const TransactionDetailsState.initial());
    });

    /// Test group for the [fetchTransactionDetails] method.
    group('fetchTransactionDetails', () {
      /// Test case for a successful fetch operation.
      blocTest<TransactionDetailsCubit, TransactionDetailsState>(
        'should emit [loading, loaded] when successful',
        build: () {
          when(() => mockGetTransactionDetails(any()))
              .thenAnswer((_) async => Right(tTransactionDetailsEntity));
          return cubit;
        },
        act: (cubit) => cubit.fetchTransactionDetails(tTransactionId),
        expect: () => [
          const TransactionDetailsState.loading(),
          TransactionDetailsState.loaded(
            transaction: tTransactionDetailsEntity,
          ),
        ],
        verify: (_) {
          verify(
            () => mockGetTransactionDetails(
              const GetTransactionDetailsParams(id: tTransactionId),
            ),
          );
        },
      );

      /// Test case for an unsuccessful fetch operation.
      blocTest<TransactionDetailsCubit, TransactionDetailsState>(
        'should emit [loading, error] when unsuccessful',
        build: () {
          when(() => mockGetTransactionDetails(any()))
              .thenAnswer((_) async => Left(ServerFailure()));
          return cubit;
        },
        act: (cubit) => cubit.fetchTransactionDetails(tTransactionId),
        expect: () => [
          const TransactionDetailsState.loading(),
          const TransactionDetailsState.error(
            message: 'Failed to fetch transaction details. Please try again.',
          ),
        ],
        verify: (_) {
          verify(
            () => mockGetTransactionDetails(
              const GetTransactionDetailsParams(id: tTransactionId),
            ),
          );
        },
      );
    });
  });
}
