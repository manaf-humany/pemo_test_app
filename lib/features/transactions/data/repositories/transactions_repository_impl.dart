import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  TransactionsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final TransactionsRemoteDataSource remoteDataSource;
  final TransactionsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

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
