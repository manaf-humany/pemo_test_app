import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/error/exceptions.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/core/network/network_info.dart';
import 'package:pemo_test_project/features/transactions/data/datasources/transactions_local_data_source.dart';
import 'package:pemo_test_project/features/transactions/data/datasources/transactions_remote_data_source.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';
import 'package:pemo_test_project/features/transactions/domain/repositories/transactions_repository.dart';

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
  Future<Either<Failure, List<TransactionItemEntity>>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransactions = await remoteDataSource.getTransactions();
        await localDataSource.cacheTransactions(remoteTransactions);
        return Right(remoteTransactions);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTransactions = await localDataSource.getTransactions();
        return Right(localTransactions);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
