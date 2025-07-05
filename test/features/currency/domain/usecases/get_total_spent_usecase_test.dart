// ignore_for_file: avoid_implementing_value_types

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/currency/currency.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// A mock implementation of [CurrencyRepository] for testing purposes.
class MockCurrencyRepository extends Mock implements CurrencyRepository {}

/// A fake implementation of [TransactionItemEntity] for testing purposes.
// ignore: prefer_mixin
class FakeTransactionItemEntity extends Fake implements TransactionItemEntity {}

/// The main function for running tests.
void main() {
  /// The use case being tested.
  late GetTotalSpent usecase;

  /// A mock implementation of [CurrencyRepository].
  late MockCurrencyRepository mockCurrencyRepository;

  setUp(() {
    // Initialize the mock repository.
    mockCurrencyRepository = MockCurrencyRepository();
    // Initialize the use case with the mock repository.
    usecase = GetTotalSpent(
      currencyRepository: mockCurrencyRepository,
    );
  });

  /// A sample transaction item entity for testing.
  final tTransaction1 = TransactionItemEntity(
    id: '1',
    name: 'Grocery Shopping',
    date: 1625142600,
    merchant: 'SuperMart',
    billingAmount: 45.75,
    image: 'https://example.com/grocery.png',
    billingCurrency: 'EUR',
  );

  /// Another sample transaction item entity for testing.
  final tTransaction2 = TransactionItemEntity(
    id: '2',
    name: 'Coffee',
    date: 1625142600,
    merchant: 'Coffee Shop',
    billingAmount: 3.50,
    image: 'https://example.com/coffee.png',
    billingCurrency: 'USD',
  );

  /// A sample transaction item entity representing a refund.
  final tTransaction3 = TransactionItemEntity(
    id: '3',
    name: 'Refund',
    date: 1625142600,
    merchant: 'Refund',
    billingAmount: -5.00,
    image: 'https://example.com/refund.png',
    billingCurrency: 'USD',
  );

  /// Test group for [GetTotalSpent] use case.
  group('GetTotalSpent', () {
    /// Test case: should get exchange rates and calculate total spent.
    test('should get exchange rates and calculate total spent', () async {
      // Arrange
      final mockRates = {
        'USD': 1.0,
        'EUR': 1.171474,
      };
      when(() => mockCurrencyRepository.getExchangeRates())
          .thenAnswer((_) async => Right(mockRates));

      // Act
      final result = await usecase(
        GetTotalSpentParams(
          transactions: [tTransaction1, tTransaction2],
        ),
      );

      // Assert
      verify(() => mockCurrencyRepository.getExchangeRates());
      expect(result, equals(Right(57.0949355)));
    });

    /// Test case: should handle negative amounts (refunds) correctly.
    test('should handle negative amounts (refunds) correctly', () async {
      // Arrange
      final mockRates = {
        'USD': 1.0,
        'EUR': 1.171474,
      };
      when(() => mockCurrencyRepository.getExchangeRates())
          .thenAnswer((_) async => Right(mockRates));

      // Act
      final result = await usecase(
        GetTotalSpentParams(
          transactions: [tTransaction2, tTransaction3],
        ),
      );

      // Assert
      verify(() => mockCurrencyRepository.getExchangeRates());
      expect(result, equals(Right(3.50)));
    });

    /// Test case: should handle unknown currencies with a 1:1 rate.
    /// The default rate for unknown currencies is 1.0.
    test('should handle unknown currencies with 1:1 rate', () async {
      // Arrange
      final mockRates = {
        'USD': 1.0,
        'EUR': 1.171474,
      };
      when(() => mockCurrencyRepository.getExchangeRates())
          .thenAnswer((_) async => Right(mockRates));

      final transactionWithUnknownCurrency = TransactionItemEntity(
        id: '4',
        name: 'Unknown Currency',
        date: 1625142600,
        merchant: 'Unknown Merchant',
        billingAmount: 10.00,
        image: 'https://example.com/unknown.png',
        billingCurrency: 'XYZ',
      );

      // Act
      final result = await usecase(
        GetTotalSpentParams(
          transactions: [
            tTransaction1,
            transactionWithUnknownCurrency,
          ],
        ),
      );

      // Assert
      verify(() => mockCurrencyRepository.getExchangeRates());
      expect(result, equals(Right(45.75 * 1.171474 + 10.00)));
    });

    /// Test case: should return Failure when the currency repository fails.
    /// This simulates a scenario where fetching exchange rates fails.
    test('should return Failure when currency repository fails', () async {
      // Arrange
      when(() => mockCurrencyRepository.getExchangeRates())
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await usecase(
        GetTotalSpentParams(
          transactions: [tTransaction1],
        ),
      );

      // Assert
      verify(() => mockCurrencyRepository.getExchangeRates());
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
