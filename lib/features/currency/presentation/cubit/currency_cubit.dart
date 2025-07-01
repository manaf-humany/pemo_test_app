import 'package:bloc/bloc.dart';
import 'package:pemo_test_project/features/features.dart';

/// A [Cubit] for managing the state of currency-related operations.
///
/// This cubit is responsible for calculating the total spent amount from a list
/// of transactions by using the [GetTotalSpent]. It emits states that
/// the UI can listen to, such as loading, loaded, and error states.
class CurrencyCubit extends Cubit<CurrencyState> {
  /// Creates an instance of [CurrencyCubit].
  ///
  /// Requires a [GetTotalSpent] to be injected.
  CurrencyCubit({required this.getTotalSpent}) : super(CurrencyState.initial());

  /// The use case for calculating the total spent amount.
  final GetTotalSpent getTotalSpent;

  /// Calculates the total spent amount from a list of transactions.
  ///
  /// This method takes a list of [TransactionItemEntity], emits a [CurrencyLoading]
  /// state, then uses the [GetTotalSpent] to perform the calculation.
  /// On success, it emits a [CurrencyLoaded] state with the total amount.
  /// On failure, it emits a [CurrencyError] state.
  Future<void> calculateTotalSpent(
    List<TransactionItemEntity> transactions,
  ) async {
    emit(CurrencyState.loading());
    try {
      final total = await getTotalSpent(transactions);
      emit(CurrencyState.loaded(totalSpent: total));
    } catch (e) {
      emit(
        const CurrencyState.error(
          message: 'Failed to calculate total spent.',
        ),
      );
    }
  }
}
