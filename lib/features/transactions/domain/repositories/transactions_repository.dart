import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// Abstract class representing a repository for managing transactions.
///
/// This class defines the contract for interacting with transaction data.
/// Implementations of this class will provide the actual logic for fetching
/// transactions from a data source (e.g., API, local database).
abstract class TransactionsRepository {
  Future<Either<Failure, TransactionsEntity>> getTransactions();
}
