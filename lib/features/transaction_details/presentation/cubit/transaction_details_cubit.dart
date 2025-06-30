import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

class TransactionDetailsCubit extends Cubit<TransactionDetailsState> {
  TransactionDetailsCubit({required this.getTransactionDetails})
      : super(const TransactionDetailsState.initial());
  final GetTransactionDetails getTransactionDetails;

  /// The ID of the transaction being displayed. Stored to allow for retries.
  String? transactionId;

  Future<void> fetchTransactionDetails(String id) async {
    transactionId = id;
    emit(const TransactionDetailsState.loading());
    final failureOrTransaction = await getTransactionDetails(Params(id: id));
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
