import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// Mock class for [TransactionDetailsRemoteDataSource].
class MockRemoteDataSource extends Mock
    implements TransactionDetailsRemoteDataSource {}

/// Mock class for [TransactionDetailsLocalDataSource].
class MockLocalDataSource extends Mock
    implements TransactionDetailsLocalDataSource {}

/// Fake class for [TransactionDetailsModel].
/// Used for fallback values in mocktail.
class FakeTransactionDetailsModel extends Fake
    implements TransactionDetailsModel {}

/// Mock class for [NetworkInfo].
class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late TransactionDetailsRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUpAll(() {
    // Register fallback value for FakeTransactionDetailsModel.
    registerFallbackValue(
      FakeTransactionDetailsModel(),
    );
  });
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TransactionDetailsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  // Test data
  const tTransactionId = '1';
  final tTransactionDetailsModel = const TransactionDetailsModel(
    id: '1',
    name: 'Test Transaction',
    date: 1625142600,
    merchant: 'Test Merchant',
    billingAmount: 100,
    image: 'test.png',
    billingCurrency: 'USD',
  );
  final TransactionDetailsEntity tTransactionDetailsEntity =
      tTransactionDetailsModel.toEntity();

  /// Helper function to run tests when the device is online.
  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  /// Helper function to run tests when the device is offline.
  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  /// Test group for [TransactionDetailsRepositoryImpl.getTransactionDetails].
  group('getTransactionDetails', () {
    runTestsOnline(() {
      test(
        /// Test case: Should return remote data when the call to remote data source is successful.
        'should return remote data when the call to remote data source is successful',
        () async {
          // Arrange
          when(() => mockRemoteDataSource.getTransactionDetails(any()))
              .thenAnswer((_) async => tTransactionDetailsModel);
          when(() => mockLocalDataSource.cacheTransactionDetails(any()))
              .thenAnswer((_) async => {});

          // Act
          final result = await repository.getTransactionDetails(tTransactionId);

          // Assert
          verify(
            () => mockRemoteDataSource.getTransactionDetails(tTransactionId),
          );
          verify(
            () => mockLocalDataSource
                .cacheTransactionDetails(tTransactionDetailsModel),
          );
          expect(result, equals(Right(tTransactionDetailsEntity)));
        },
      );

      test(
        /// Test case: Should return server failure when the call to remote data source is unsuccessful.
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // Arrange
          when(() => mockRemoteDataSource.getTransactionDetails(any()))
              .thenThrow(ServerException());

          // Act
          final result = await repository.getTransactionDetails(tTransactionId);

          // Assert
          verify(
            () => mockRemoteDataSource.getTransactionDetails(tTransactionId),
          );
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        /// Test case: Should return last locally cached data when the cached data is present.
        'should return last locally cached data when the cached data is present',
        () async {
          // Arrange
          when(() => mockLocalDataSource.getTransactionDetails(any()))
              .thenAnswer((_) async => tTransactionDetailsModel);

          // Act
          final result = await repository.getTransactionDetails(tTransactionId);

          // Assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(
            () => mockLocalDataSource.getTransactionDetails(tTransactionId),
          );
          expect(result, equals(Right(tTransactionDetailsEntity)));
        },
      );

      test(
        /// Test case: Should return cache failure when there is no cached data present.
        'should return cache failure when there is no cached data present',
        () async {
          // Arrange
          when(() => mockLocalDataSource.getTransactionDetails(any()))
              .thenThrow(CacheException());

          // Act
          final result = await repository.getTransactionDetails(tTransactionId);

          // Assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(
            () => mockLocalDataSource.getTransactionDetails(tTransactionId),
          );
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
