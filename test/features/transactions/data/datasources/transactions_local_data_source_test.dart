import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// A mock implementation of [Box<TransactionsModel>] for testing purposes.
class MockHiveBox extends Mock implements Box<TransactionsModel> {}

/// The main function for the test suite.
void main() {
  late TransactionsLocalDataSourceImpl dataSource;
  late MockHiveBox mockBox;

  /// Setup method that runs before each test.
  /// Initializes [mockBox] and [dataSource].
  setUp(() {
    mockBox = MockHiveBox();
    dataSource = TransactionsLocalDataSourceImpl(box: mockBox);
  });

  /// Group of tests for the [TransactionsLocalDataSourceImpl.cacheTransactions] method.
  group('cacheTransactions', () {
    final tTransactionsModel = TransactionsModel(
      transactions: [
        TransactionItemModel(
          id: '1',
          name: 'Grocery Shopping',
          billingAmount: 45.75,
          date: DateTime.parse('2025-07-01T10:30:00Z').millisecondsSinceEpoch,
          merchant: 'SuperMart',
          image: 'https://example.com/grocery.png',
          billingCurrency: 'USD',
        ),
        TransactionItemModel(
          id: '2',
          name: 'Salary Deposit',
          billingAmount: 3000.00,
          date: DateTime.parse('2025-07-01T09:00:00Z').millisecondsSinceEpoch,
          merchant: 'MyCompany Inc.',
          image: 'https://example.com/salary.png',
          billingCurrency: 'USD',
        ),
      ],
    );

    /// Test case: Verifies that Hive is called to cache data with the correct key.
    test(
      'should call Hive to cache the data with the correct key',
      () async {
        // Arrange
        when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

        // Act
        await dataSource.cacheTransactions(tTransactionsModel);

        // Assert
        verify(() => mockBox.put(kCachedTransactionsKey, tTransactionsModel));
      },
    );

    /// Test case: Verifies that a [CacheException] is thrown when caching fails.
    test(
      'should throw a CacheException when there is an error caching the data',
      () async {
        // Arrange
        when(() => mockBox.put(any(), any()))
            .thenThrow(Exception('Failed to write to Hive'));

        // Act
        final call = dataSource.cacheTransactions;

        // Assert
        expect(() => call(tTransactionsModel), throwsA(isA<CacheException>()));
      },
    );
  });

  /// Group of tests for the [TransactionsLocalDataSourceImpl.getTransactions] method.
  group('getTransactions', () {
    final tTransactionsModel = TransactionsModel(
      transactions: [
        TransactionItemModel(
          id: '1',
          name: 'Grocery Shopping',
          billingAmount: 45.75,
          date: DateTime.parse('2025-07-01T10:30:00Z').millisecondsSinceEpoch,
          merchant: 'SuperMart',
          image: 'https://example.com/grocery.png',
          billingCurrency: 'USD',
        ),
      ],
    );

    /// Test case: Verifies that [TransactionsModel] is returned from Hive when data is cached.
    test(
      'should return TransactionsModel from Hive when there is cached data',
      () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(tTransactionsModel);

        // Act
        final result = await dataSource.getTransactions();

        // Assert
        verify(() => mockBox.get(kCachedTransactionsKey));
        expect(result, equals(tTransactionsModel));
      },
    );

    /// Test case: Verifies that a [CacheException] is thrown when no data is cached.
    test(
      'should throw a CacheException when there is no cached data',
      () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(null);

        // Act
        final call = dataSource.getTransactions;

        // Assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );

    /// Test case: Verifies that a [CacheException] is thrown when Hive throws an exception.
    test(
      'should throw a CacheException when Hive throws an exception',
      () async {
        // Arrange
        when(() => mockBox.get(any()))
            .thenThrow(Exception('Failed to read from Hive'));

        // Act
        final call = dataSource.getTransactions;

        // Assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );

    /// Test case: Verifies that [CacheException] is rethrown if thrown directly by Hive.
    test(
      'should rethrow CacheException when it is thrown directly',
      () async {
        // Arrange
        when(() => mockBox.get(any())).thenThrow(CacheException());

        // Act
        final call = dataSource.getTransactions;

        // Assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });
}
