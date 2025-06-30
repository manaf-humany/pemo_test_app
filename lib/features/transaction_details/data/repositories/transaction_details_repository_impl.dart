import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/error/exceptions.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/core/network/network_info.dart';
import 'package:pemo_test_project/features/transaction_details/data/datasources/transaction_details_local_data_source.dart';
import 'package:pemo_test_project/features/transaction_details/data/datasources/transaction_details_remote_data_source.dart';
import 'package:pemo_test_project/features/transaction_details/data/models/transaction_details_model.dart';
import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';
import 'package:pemo_test_project/features/transaction_details/domain/repositories/transaction_details_repository.dart';

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
