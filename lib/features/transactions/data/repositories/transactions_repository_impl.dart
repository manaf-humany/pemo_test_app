import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// Implementation of [TransactionsRepository]
class TransactionsRepositoryImpl implements TransactionsRepository {
  TransactionsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// Remote data source for transactions.
  final TransactionsRemoteDataSource remoteDataSource;

  /// Local data source for transactions.
  final TransactionsLocalDataSource localDataSource;

  /// Network information provider.
  final NetworkInfo networkInfo;

  /// Gets transactions from remote or local data source.
  /// If device is connected to internet, it gets transactions from remote data source and caches them.
  /// If device is not connected to internet, it gets transactions from local data source.
  @override
  Future<Either<Failure, TransactionsEntity>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransactions = await remoteDataSource.getTransactions();
        await localDataSource.cacheTransactions(remoteTransactions);
        return Right(remoteTransactions.toEntity());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTransactions = await localDataSource.getTransactions();
        return Right(localTransactions.toEntity());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
