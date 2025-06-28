import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transactions.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, TransactionsEntity>> getTransactions();
}
