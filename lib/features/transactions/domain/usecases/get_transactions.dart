import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// [GetTransactions] is a use case that retrieves a list of transactions.
///
/// It implements the [UseCase] interface, which defines a standard contract
/// for use cases. It takes [NoParams] as input, meaning it doesn't require
/// any specific parameters to execute. It returns a [Future] that resolves
/// to an [Either] type, which can either be a [Failure] or a
/// [TransactionsEntity].
class GetTransactions implements UseCase<TransactionsEntity, NoParams> {
  /// Constructs a [GetTransactions] instance with the given [repository].
  ///
  /// The [repository] is responsible for fetching the transaction data.
  GetTransactions(this.repository);

  /// The repository used to fetch transaction data.
  final TransactionsRepository repository;

  /// Executes the use case to retrieve transactions.
  @override
  Future<Either<Failure, TransactionsEntity>> call(NoParams params) async {
    return await repository.getTransactions();
  }
}
