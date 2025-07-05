import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// Manages the state for the transaction details screen.
class TransactionDetailsCubit extends Cubit<TransactionDetailsState> {
  TransactionDetailsCubit({required this.getTransactionDetails})
      : super(const TransactionDetailsState.initial());

  /// Use case for fetching transaction details.
  final GetTransactionDetails getTransactionDetails;

  /// The ID of the transaction being displayed. Stored to allow for retries.
  String? transactionId;

  /// Fetches the details for a transaction with the given [id].
  Future<void> fetchTransactionDetails(String id) async {
    transactionId = id;
    emit(const TransactionDetailsState.loading());
    final failureOrTransaction =
        await getTransactionDetails(GetTransactionDetailsParams(id: id));
    emit(
      failureOrTransaction.fold(
        (failure) => const TransactionDetailsState.error(
          message: 'Failed to fetch transaction details. Please try again.',
        ),
        (transaction) =>
            TransactionDetailsState.loaded(transaction: transaction),
      ),
    );
  }
}
