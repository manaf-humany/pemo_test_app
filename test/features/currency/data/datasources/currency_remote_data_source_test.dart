import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/currency/currency.dart';

/// Mock class for [CurrencyRemoteDataSource].
class MockCurrencyRemoteDataSource extends Mock
    implements CurrencyRemoteDataSource {}

/// Main function for running tests.
/// Sets up a mock [CurrencyRemoteDataSource] before each test.
void main() {
  late CurrencyRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockCurrencyRemoteDataSource();
  });

  /// Group of tests for the 'getExchangeRates' method.
  group('getExchangeRates', () {
    /// Test to verify that the method returns hardcoded exchange rates successfully.
    test('should return hardcoded exchange rates', () async {
      // Arrange
      final expectedRates = {
        'USD': 1.0,
        'EUR': 1.171474,
        'GBP': 1.369340,
        'INR': 0.011656,
      };
      when(() => remoteDataSource.getExchangeRates())
          .thenAnswer((_) async => expectedRates);

      // Act
      final result = await remoteDataSource.getExchangeRates();

      // Assert
      expect(result, equals(expectedRates));
      verify(() => remoteDataSource.getExchangeRates());
    });

    /// Test to verify that the method throws a [ServerException] when the data source fails.
    test('should throw ServerException when data source fails', () async {
      // Arrange
      when(() => remoteDataSource.getExchangeRates())
          .thenThrow(ServerException());

      // Act
      final call = remoteDataSource.getExchangeRates;

      // Assert
      expect(() => call(), throwsA(isA<ServerException>()));
      verify(() => remoteDataSource.getExchangeRates());
    });

    /// Test to verify that the method throws a [ServerException] when the data source throws any exception.
    test('should throw ServerException when data source throws any exception',
        () async {
      // Arrange
      when(() => remoteDataSource.getExchangeRates())
          .thenThrow(ServerException());

      // Act
      final call = remoteDataSource.getExchangeRates;

      // Assert
      expect(() => call(), throwsA(isA<ServerException>()));
      verify(() => remoteDataSource.getExchangeRates());
    });
  });
}
