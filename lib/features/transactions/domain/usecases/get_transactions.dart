import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

class GetTransactions implements UseCase<TransactionsEntity, NoParams> {
  GetTransactions(this.repository);
  final TransactionsRepository repository;

  @override
  Future<Either<Failure, TransactionsEntity>> call(NoParams params) async {
    return await repository.getTransactions();
  }
}
