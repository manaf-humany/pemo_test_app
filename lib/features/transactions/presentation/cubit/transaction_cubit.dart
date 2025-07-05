import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/features.dart';

/// A [Cubit] that manages the state of transactions.
class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({required this.getTransactions})
      : super(const TransactionState.initial());

  /// The use case for getting transactions.
  final GetTransactions getTransactions;

  /// Fetches the transactions from the repository.
  Future<void> fetchTransactions() async {
    emit(const TransactionState.loading());
    final failureOrTransactions = await getTransactions(NoParams());
    failureOrTransactions.fold(
      (failure) => emit(TransactionState.error(failure.toString())),
      (transactions) =>
          emit(TransactionState.loaded(transactions.transactions)),
    );
  }
}
