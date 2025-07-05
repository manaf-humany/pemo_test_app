import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// A mock implementation of [Dio] for testing purposes.
class MockDio extends Mock implements Dio {}

void main() {
  late TransactionDetailsRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = TransactionDetailsRemoteDataSourceImpl(client: mockDio);
  });

  /// Test group for the [TransactionDetailsRemoteDataSourceImpl.getTransactionDetails] method.
  group('getTransactionDetails', () {
    const tTransactionId = '1';
    final tTransactionDetailsJson = {
      'id': '1',
      'name': 'Grocery Shopping',
      'date': 1625142600,
      'merchant': 'SuperMart',
      'billingAmount': 45.75,
      'image': 'https://example.com/grocery.png',
      'billingCurrency': 'USD',
    };
    final tTransactionDetailsModel =
        TransactionDetailsModel.fromJson(tTransactionDetailsJson);

    test(
      /// Test case to verify that a GET request is performed to the correct endpoint
      /// when [TransactionDetailsRemoteDataSourceImpl.getTransactionDetails] is called.
      'should perform a GET request to the correct endpoint',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tTransactionDetailsJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: 'transaction/$tTransactionId'),
          ),
        );

        // Act
        await dataSource.getTransactionDetails(tTransactionId);

        // Assert
        verify(() => mockDio.get('transaction/$tTransactionId'));
      },
    );

    test(
      /// Test case to verify that [TransactionDetailsModel] is returned when the
      /// response from the GET request is successful (status code 200).
      'should return TransactionDetailsModel when the response is successful',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenAnswer(
          (_) async => Response(
            data: tTransactionDetailsJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: 'transaction/$tTransactionId'),
          ),
        );

        // Act
        final result = await dataSource.getTransactionDetails(tTransactionId);

        // Assert
        expect(result, equals(tTransactionDetailsModel));
      },
    );

    test(
      /// Test case to verify that a [ServerException] is thrown when the [Dio] client
      /// throws an exception during the GET request.
      'should throw a ServerException when Dio throws an exception',
      () async {
        // Arrange
        when(() => mockDio.get(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: 'transaction/$tTransactionId'),
            error: 'Connection timeout',
          ),
        );

        // Act
        final call = dataSource.getTransactionDetails;

        // Assert
        expect(() => call(tTransactionId), throwsA(isA<ServerException>()));
      },
    );
  });
}
