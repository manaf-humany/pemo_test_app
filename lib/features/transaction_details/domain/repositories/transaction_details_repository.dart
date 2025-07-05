import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// Abstract class defining the contract for transaction details repositories.
abstract class TransactionDetailsRepository {
  /// Retrieves transaction details for a given transaction ID.
  ///
  /// Returns a [Future] that resolves to an [Either] containing a [Failure] or a [TransactionDetailsEntity].
  Future<Either<Failure, TransactionDetailsEntity>> getTransactionDetails(
    String transactionId,
  );
}
