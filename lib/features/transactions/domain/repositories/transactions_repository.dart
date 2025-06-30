import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, TransactionsEntity>> getTransactions();
}
