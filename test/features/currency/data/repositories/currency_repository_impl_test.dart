import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/currency/currency.dart';

/// A mock implementation of [CurrencyRemoteDataSource] for testing purposes.
class MockCurrencyRemoteDataSource extends Mock
    implements CurrencyRemoteDataSource {}

/// Test suite for [CurrencyRepositoryImpl].
void main() {
  /// The repository instance being tested.
  late CurrencyRepositoryImpl repository;

  /// The mock remote data source.
  late MockCurrencyRemoteDataSource mockRemoteDataSource;

  /// Sets up the test environment before each test case.
  setUp(() {
    mockRemoteDataSource = MockCurrencyRemoteDataSource();
    // Initializes the repository with the mock remote data source.
    repository = CurrencyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  /// Test group for the `getExchangeRates` method of [CurrencyRepositoryImpl].
  group('getExchangeRates', () {
    test(

        /// Tests that the repository returns rates from the remote data source
        /// when the call is successful.
        'should return rates from remote data source when the call is successful',
        () async {
      // Arrange
      final mockRates = {'USD': 1.0, 'EUR': 1.1};
      when(() => mockRemoteDataSource.getExchangeRates())
          .thenAnswer((_) async => mockRates);

      // Act
      final result = await repository.getExchangeRates();

      // Assert
      verify(() => mockRemoteDataSource.getExchangeRates());
      expect(result, equals(Right(mockRates)));
    });

    test(

        /// Tests that the repository returns a [ServerFailure] when the remote
        /// data source throws a [ServerException].
        'should return ServerFailure when remote data source throws a ServerException',
        () async {
      // Arrange
      when(() => mockRemoteDataSource.getExchangeRates())
          .thenThrow(ServerException());

      // Act
      final result = await repository.getExchangeRates();

      // Assert
      verify(() => mockRemoteDataSource.getExchangeRates());
      expect(result, equals(Left(ServerFailure())));
    });

    test(

        /// Tests that the repository returns a [ServerFailure] when the remote
        /// data source throws any other exception.
        'should return ServerFailure when remote data source throws any other exception',
        () async {
      // Arrange
      when(() => mockRemoteDataSource.getExchangeRates())
          .thenThrow(Exception());

      // Act
      final result = await repository.getExchangeRates();

      // Assert
      verify(() => mockRemoteDataSource.getExchangeRates());
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
