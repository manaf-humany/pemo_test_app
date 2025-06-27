import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/features/transaction_details/domain/usecases/get_transaction_details.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/cubit/transaction_details_state.dart';

class TransactionDetailsCubit extends Cubit<TransactionDetailsState> {
  TransactionDetailsCubit({required this.getTransactionDetails})
    : super(const TransactionDetailsState.initial());
  final GetTransactionDetails getTransactionDetails;

  Future<void> fetchTransactionDetails(String id) async {
    emit(const TransactionDetailsState.loading());
    final failureOrTransaction = await getTransactionDetails(Params(id: id));
    emit(
      failureOrTransaction.fold(
        (failure) => TransactionDetailsState.error(
          message: 'Failed to fetch transaction details',
        ), // Simplified error message
        (transaction) =>
            TransactionDetailsState.loaded(transaction: transaction),
      ),
    );
  }
}
