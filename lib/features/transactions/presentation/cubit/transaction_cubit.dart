import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/core/usecases/usecase.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({required this.getTransactions})
      : super(const TransactionState.initial());
  final GetTransactions getTransactions;

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
