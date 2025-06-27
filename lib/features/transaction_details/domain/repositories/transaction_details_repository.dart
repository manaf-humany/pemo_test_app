import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';

abstract class TransactionDetailsRepository {
  Future<Either<Failure, TransactionDetails>> getTransactionDetails(
    String transactionId,
  );
}
