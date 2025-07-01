import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/features.dart';

part 'transaction_details_state.freezed.dart';

/// The base class for all states related to the transaction details feature.
///
/// Using an abstract base class allows for better type checking and state
/// management within the BLoC/Cubit pattern.

@freezed
abstract class TransactionDetailsState with _$TransactionDetailsState {
  const factory TransactionDetailsState.initial() = _Initial;
  const factory TransactionDetailsState.loading() = _Loading;
  const factory TransactionDetailsState.loaded({
    required TransactionDetailsEntity transaction,
  }) = _Loaded;
  const factory TransactionDetailsState.error({required String message}) =
      _Error;
}
