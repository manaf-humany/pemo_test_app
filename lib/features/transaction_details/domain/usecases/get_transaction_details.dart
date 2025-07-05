import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// [GetTransactionDetails] is a use case that retrieves the details of a specific transaction.
///
/// It implements the [UseCase] interface, taking [TransactionDetailsEntity] as the success type
/// and [GetTransactionDetailsParams] as the parameters type.
class GetTransactionDetails
    implements UseCase<TransactionDetailsEntity, GetTransactionDetailsParams> {
  /// Creates an instance of [GetTransactionDetails].
  ///
  /// Requires a [TransactionDetailsRepository] to fetch transaction details.
  GetTransactionDetails(this.repository);

  /// The repository responsible for fetching transaction details.
  final TransactionDetailsRepository repository;

  /// Executes the use case to get transaction details.
  ///
  /// Takes [GetTransactionDetailsParams] containing the transaction ID.
  /// Returns a [Future] of [Either] [Failure] or [TransactionDetailsEntity].
  @override
  Future<Either<Failure, TransactionDetailsEntity>> call(
    GetTransactionDetailsParams params,
  ) async {
    return await repository.getTransactionDetails(params.id);
  }
}

/// [GetTransactionDetailsParams] represents the parameters required for the [GetTransactionDetails] use case.
class GetTransactionDetailsParams extends Equatable {
  /// Creates an instance of [GetTransactionDetailsParams].
  /// Requires the [id] of the transaction to be fetched.
  const GetTransactionDetailsParams({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
