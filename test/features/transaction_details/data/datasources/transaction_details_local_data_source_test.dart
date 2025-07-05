import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// A mock implementation of [Box] for [TransactionDetailsModel].
class MockHiveBox extends Mock implements Box<TransactionDetailsModel> {}

/// A fake implementation of [TransactionDetailsModel] for testing purposes.
class FakeTransactionDetailsModel extends Fake
    implements TransactionDetailsModel {}

/// The main function for running tests related to [TransactionDetailsLocalDataSourceImpl].
void main() {
  /// The instance of [TransactionDetailsLocalDataSourceImpl] being tested.
  late TransactionDetailsLocalDataSourceImpl dataSource;
  late MockHiveBox mockBox;
  setUpAll(() {
    registerFallbackValue(
      FakeTransactionDetailsModel(),
    );
  });

  /// Sets up the test environment before each test case.
  setUp(() {
    mockBox = MockHiveBox();
    dataSource = TransactionDetailsLocalDataSourceImpl(box: mockBox);
  });

  /// Defines a group of tests for the 'getTransactionDetails' method.
  group('getTransactionDetails', () {
    /// A sample transaction ID used for testing.
    const tTransactionId = '1';
    final tTransactionDetailsModel = const TransactionDetailsModel(
      id: '1',
      name: 'Grocery Shopping',
      date: 1625142600,
      merchant: 'SuperMart',
      billingAmount: 45.75,
      image: 'https://example.com/grocery.png',
      billingCurrency: 'USD',
    );

    /// Tests that the method returns [TransactionDetailsModel] from Hive when data is cached.
    test(
      'should return TransactionDetailsModel from Hive when data is cached',
      () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(tTransactionDetailsModel);

        // Act
        final result = await dataSource.getTransactionDetails(tTransactionId);

        // Assert
        verify(() => mockBox.get(tTransactionId));
        expect(result, equals(tTransactionDetailsModel));
      },
    );

    /// Tests that the method throws a [CacheException] when no data is cached.
    test('should throw a CacheException when no data is cached', () async {
      // Arrange
      when(() => mockBox.get(any())).thenReturn(null);

      // Act
      final call = dataSource.getTransactionDetails;

      // Assert
      expect(() => call(tTransactionId), throwsA(isA<CacheException>()));
    });
  });

  /// Defines a group of tests for the 'cacheTransactionDetails' method.
  group('cacheTransactionDetails', () {
    /// A sample [TransactionDetailsModel] used for testing.
    final tTransactionDetailsModel = const TransactionDetailsModel(
      id: '1',
      name: 'Grocery Shopping',
      date: 1625142600,
      merchant: 'SuperMart',
      billingAmount: 45.75,
      image: 'https://example.com/grocery.png',
      billingCurrency: 'USD',
    );

    /// Tests that the method calls Hive to cache the data.
    test('should call Hive to cache the data', () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

      // Act
      await dataSource.cacheTransactionDetails(tTransactionDetailsModel);

      // Assert
      verify(
        () =>
            mockBox.put(tTransactionDetailsModel.id, tTransactionDetailsModel),
      );
    });
  });
}
