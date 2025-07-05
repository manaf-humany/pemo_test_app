// ignore_for_file: avoid_implementing_value_types

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/currency/currency.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// A mock implementation of the [GetTotalSpent] use case.
class MockGetTotalSpent extends Mock implements GetTotalSpent {}

/// A fake implementation of [TransactionItemEntity] for testing purposes.
class FakeTransactionItemEntity extends Fake implements TransactionItemEntity {}

/// The main function for running tests related to the [CurrencyCubit].
void main() {
  late CurrencyCubit cubit;
  late MockGetTotalSpent mockGetTotalSpent;

  /// Sets up initial configurations before running any tests.
  /// Registers a fallback value for [GetTotalSpentParams].
  setUpAll(() {
    registerFallbackValue(const GetTotalSpentParams(transactions: []));
  });

  setUp(() {
    mockGetTotalSpent = MockGetTotalSpent();
    cubit = CurrencyCubit(
      getTotalSpent: mockGetTotalSpent,
    );
  });

  /// Groups tests for the [CurrencyCubit].
  group('CurrencyCubit', () {
    /// Test transaction data.
    final tTransaction1 = TransactionItemEntity(
      id: '1',
      name: 'Grocery Shopping',
      date: 1625142600,
      merchant: 'SuperMart',
      billingAmount: 45.75,
      image: 'https://example.com/grocery.png',
      billingCurrency: 'EUR',
    );

    /// Test transaction data.
    final tTransaction2 = TransactionItemEntity(
      id: '2',
      name: 'Coffee',
      date: 1625142600,
      merchant: 'Coffee Shop',
      billingAmount: 3.50,
      image: 'https://example.com/coffee.png',
      billingCurrency: 'USD',
    );

    /// A list of test transactions.
    final tTransactions = [tTransaction1, tTransaction2];

    /// The expected total spent amount for the test transactions.
    const tTotalSpent = 57.0949355;

    /// Tests that the cubit emits an error state when the use case throws an exception.
    blocTest<CurrencyCubit, CurrencyState>(
      'should emit error state when use case throws',
      build: () {
        when(
          () => mockGetTotalSpent(
            any(),
          ),
        ).thenThrow(Exception());
        return cubit;
      },
      act: (cubit) => cubit.calculateTotalSpent(tTransactions),
      expect: () => [
        CurrencyState.loading(),
        const CurrencyState.error(message: 'Failed to calculate total spent.'),
      ],
    );

    /// Tests that the cubit emits a loaded state with the total spent when the calculation succeeds.
    blocTest<CurrencyCubit, CurrencyState>(
      'should emit loaded state with total spent when calculation succeeds',
      build: () {
        when(
          () => mockGetTotalSpent(
            any(),
          ),
        ).thenAnswer((_) async => Right(tTotalSpent));
        return cubit;
      },
      act: (cubit) => cubit.calculateTotalSpent(tTransactions),
      expect: () => [
        CurrencyState.loading(),
        CurrencyState.loaded(totalSpent: tTotalSpent),
      ],
    );

    /// Tests that the cubit emits a loaded state with the total spent when the calculation succeeds.
    blocTest<CurrencyCubit, CurrencyState>(
      'should emit loaded state with total spent when calculation succeeds',
      build: () {
        when(
          () => mockGetTotalSpent(
            any(),
          ),
        ).thenAnswer((_) async => Right(tTotalSpent));
        return cubit;
      },
      act: (cubit) => cubit.calculateTotalSpent(tTransactions),
      expect: () => [
        CurrencyState.loading(),
        CurrencyState.loaded(totalSpent: tTotalSpent),
      ],
    );

    /// Tests that the cubit emits an error state when the calculation fails (returns a [Failure]).
    blocTest<CurrencyCubit, CurrencyState>(
      'should emit error state when calculation fails',
      build: () {
        when(
          () => mockGetTotalSpent(
            any(),
          ),
        ).thenAnswer((_) async => Left(ServerFailure()));
        return cubit;
      },
      act: (cubit) => cubit.calculateTotalSpent(tTransactions),
      expect: () => [
        CurrencyState.loading(),
        const CurrencyState.error(message: 'Failed to calculate total spent.'),
      ],
    );

    /// Tests that the cubit emits an error state when the use case throws an exception.
    blocTest<CurrencyCubit, CurrencyState>(
      'should emit error state when use case throws',
      build: () {
        when(
          () => mockGetTotalSpent(
            any(),
          ),
        ).thenThrow(Exception());
        return cubit;
      },
      act: (cubit) => cubit.calculateTotalSpent(tTransactions),
      expect: () => [
        CurrencyState.loading(),
        const CurrencyState.error(message: 'Failed to calculate total spent.'),
      ],
    );
  });
}
