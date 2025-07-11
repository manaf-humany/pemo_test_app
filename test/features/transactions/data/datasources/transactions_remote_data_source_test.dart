import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// A mock implementation of [Dio] for testing purposes.
class MockDio extends Mock implements Dio {}

void main() {
  /// The remote data source implementation being tested.
  late TransactionsRemoteDataSourceImpl dataSource;

  /// The mock [Dio] instance.
  late MockDio mockDio;

  /// Sets up the test environment before each test.
  setUp(() {
    mockDio = MockDio();
    dataSource = TransactionsRemoteDataSourceImpl(client: mockDio);
  });

  /// Tests for the `getTransactions` method.
  group('getTransactions', () {
    final tTransactionsJson = [
      {
        'id': '1',
        'name': 'Grocery Shopping',
        'billingAmount': 45.75,
        'date': DateTime.parse('2025-07-01T10:30:00Z').millisecondsSinceEpoch,
        'merchant': 'SuperMart',
        'image': 'https://example.com/grocery.png',
        'billingCurrency': 'USD',
      },
      {
        'id': '2',
        'name': 'Salary Deposit',
        'billingAmount': 3000.00,
        'date': DateTime.parse('2025-07-01T09:00:00Z').millisecondsSinceEpoch,
        'merchant': 'MyCompany Inc.',
        'image': 'https://example.com/salary.png',
        'billingCurrency': 'USD',
      },
    ];

    final tTransactionsModel =
        TransactionsModel.fromJson({'transactions': tTransactionsJson});

    /// Tests that a GET request is performed to the correct endpoint
    /// with the correct headers.
    test(
      'should perform a GET request to the transactions endpoint with application/json header',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tTransactionsJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/transaction'),
          ),
        );

        // Act
        await dataSource.getTransactions();

        // Assert
        verify(() => mockDio.get('/transaction'));
      },
    );

    /// Tests that [TransactionsModel] is returned when the response code
    /// is 200 (success).
    test(
      'should return TransactionsModel when the response code is 200 (success)',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tTransactionsJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/transaction'),
          ),
        );

        // Act
        final result = await dataSource.getTransactions();

        // Assert
        expect(result, equals(tTransactionsModel));
      },
    );

    /// Tests that a [ServerException] is thrown when the response code is
    /// not 200.
    test(
      'should throw a ServerException when the response code is not 200',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: '/transaction'),
          ),
        );

        // Act
        final call = dataSource.getTransactions;

        // Assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );

    /// Tests that a [ServerException] is thrown when Dio throws an exception.
    test(
      'should throw a ServerException when Dio throws an exception',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/transaction'),
            error: 'Connection timeout',
          ),
        );

        // Act
        final call = dataSource.getTransactions;

        // Assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );

    /// Tests that the response data is correctly parsed into a
    /// [TransactionsModel].
    test(
      'should correctly parse the response data into a TransactionsModel',
      () async {
        // Arrange
        final complexResponseData = [
          {
            'id': '1',
            'name': 'Complex Transaction',
            'billingAmount': 123.45,
            'date':
                DateTime.parse('2025-07-01T10:30:00Z').millisecondsSinceEpoch,
            'merchant': 'Specialty Store',
            'image': 'https://example.com/complex.png',
            'billingCurrency': 'EUR',
          }
        ];

        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: complexResponseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/transaction'),
          ),
        );

        // Act
        final result = await dataSource.getTransactions();

        // Assert
        expect(
          result,
          equals(
            TransactionsModel.fromJson(
              {'transactions': complexResponseData},
            ),
          ),
        );
      },
    );
  });
}
