import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

abstract class TransactionDetailsRepository {
  Future<Either<Failure, TransactionDetailsEntity>> getTransactionDetails(
    String transactionId,
  );
}
