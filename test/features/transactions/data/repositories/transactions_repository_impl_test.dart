import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// Mock for [TransactionsRemoteDataSource].
class MockTransactionsRemoteDataSource extends Mock
    implements TransactionsRemoteDataSource {}

/// Mock for [TransactionsLocalDataSource].
class MockTransactionsLocalDataSource extends Mock
    implements TransactionsLocalDataSource {}

/// Mock for [NetworkInfo].
class MockNetworkInfo extends Mock implements NetworkInfo {}

class FakeTransactionsModel extends Fake implements TransactionsModel {}

void main() {
  /// Test suite for [TransactionsRepositoryImpl].
  group('TransactionsRepositoryImpl', () {
    late TransactionsRepositoryImpl repository;
    late MockTransactionsRemoteDataSource mockRemoteDataSource;
    late MockTransactionsLocalDataSource mockLocalDataSource;
    late MockNetworkInfo mockNetworkInfo;

    const tTransactionsModel = TransactionsModel(transactions: []);
    final tTransactionsEntity = tTransactionsModel.toEntity();

    setUpAll(() {
      registerFallbackValue(FakeTransactionsModel());
    });

    setUp(() {
      mockRemoteDataSource = MockTransactionsRemoteDataSource();
      mockLocalDataSource = MockTransactionsLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();
      repository = TransactionsRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo,
      );
    });

    /// Helper function to group tests for the online scenario.
    void runTestsOnline(Function body) {
      group('device is online', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        body();
      });
    }

    /// Helper function to group tests for the offline scenario.
    void runTestsOffline(Function body) {
      group('device is offline', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
        });
        body();
      });
    }

    runTestsOnline(() {
      /// Test case for successful data fetching from the remote source.
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // Arrange
          when(() => mockRemoteDataSource.getTransactions())
              .thenAnswer((_) async => tTransactionsModel);
          when(() => mockLocalDataSource.cacheTransactions(tTransactionsModel))
              .thenAnswer((_) async => Future.value());

          // Act
          final result = await repository.getTransactions();

          // Assert
          verify(() => mockRemoteDataSource.getTransactions());
          verify(
            () => mockLocalDataSource.cacheTransactions(tTransactionsModel),
          );
          expect(result, equals(Right(tTransactionsEntity)));
        },
      );

      /// Test case for handling [ServerException] from the remote source.
      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // Arrange
          when(() => mockRemoteDataSource.getTransactions())
              .thenThrow(ServerException());

          // Act
          final result = await repository.getTransactions();

          // Assert
          verify(() => mockRemoteDataSource.getTransactions());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      /// Test case for successful data fetching from the local cache.
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // Arrange
          when(() => mockLocalDataSource.getTransactions())
              .thenAnswer((_) async => tTransactionsModel);

          // Act
          final result = await repository.getTransactions();

          // Assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getTransactions());
          expect(result, equals(Right(tTransactionsEntity)));
        },
      );

      /// Test case for handling [CacheException] from the local source.
      test(
        'should return cache failure when there is no cached data present',
        () async {
          // Arrange
          when(() => mockLocalDataSource.getTransactions())
              .thenThrow(CacheException());

          // Act
          final result = await repository.getTransactions();

          // Assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getTransactions());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
