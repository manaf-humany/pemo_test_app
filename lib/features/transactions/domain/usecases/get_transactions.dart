import 'package:dartz/dartz.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/core/usecases/usecase.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transactions.dart';
import 'package:pemo_test_project/features/transactions/domain/repositories/transactions_repository.dart';

class GetTransactions implements UseCase<TransactionsEntity, NoParams> {
  GetTransactions(this.repository);
  final TransactionsRepository repository;

  @override
  Future<Either<Failure, TransactionsEntity>> call(NoParams params) async {
    return await repository.getTransactions();
  }
}
