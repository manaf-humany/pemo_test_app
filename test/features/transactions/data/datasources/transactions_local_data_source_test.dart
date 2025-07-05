import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

class MockHiveBox extends Mock implements Box<TransactionsModel> {}

void main() {
  late TransactionsLocalDataSourceImpl dataSource;
  late MockHiveBox mockBox;

  setUp(() {
    mockBox = MockHiveBox();
    dataSource = TransactionsLocalDataSourceImpl(box: mockBox);
  });

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

  group('integration with real Hive box', () {
    // Note: In a real project, these tests would be in a separate integration test file
    // and would use a temporary directory for Hive. For this example, we're keeping them
    // here but marking them as skip to show the approach.

    test(
      'should successfully store and retrieve transactions from a real Hive box',
      () async {
        // This test would initialize a real Hive box in a temp directory,
        // register adapters, and test actual storage/retrieval
      },
      skip: 'Integration test that requires Hive initialization',
    );
  });
}
