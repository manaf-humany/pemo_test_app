import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, List<TransactionItemEntity>>> getTransactions();
}
