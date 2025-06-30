import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

class TransactionDetailsRepositoryImpl implements TransactionDetailsRepository {
  TransactionDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final TransactionDetailsRemoteDataSource remoteDataSource;
  final TransactionDetailsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, TransactionDetailsEntity>> getTransactionDetails(
    String transactionId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransaction = await remoteDataSource.getTransactionDetails(
          transactionId,
        );
        await localDataSource.cacheTransactionDetails(remoteTransaction);
        return Right(remoteTransaction.toEntity());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTransaction = await localDataSource.getTransactionDetails(
          transactionId,
        );
        return Right(localTransaction.toEntity());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
