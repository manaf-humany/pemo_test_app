import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

class GetTransactionDetails
    implements UseCase<TransactionDetailsEntity, Params> {
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
