import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/error/failures.dart';
import 'package:pemo_test_project/core/usecases/usecase.dart';
import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';
import 'package:pemo_test_project/features/transaction_details/domain/repositories/transaction_details_repository.dart';

class GetTransactionDetails implements UseCase<TransactionDetailsEntity, Params> {
  GetTransactionDetails(this.repository);
  final TransactionDetailsRepository repository;

  @override
  Future<Either<Failure, TransactionDetailsEntity>> call(Params params) async {
    return await repository.getTransactionDetails(params.id);
  }
}

class Params extends Equatable {
  const Params({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
