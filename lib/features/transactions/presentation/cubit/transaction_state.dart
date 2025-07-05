import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

part 'transaction_state.freezed.dart';

/// Represents the state of the transaction feature.
@freezed
abstract class TransactionState with _$TransactionState {
  /// The initial state of the transaction feature.
  const factory TransactionState.initial() = _Initial;

  /// The loading state of the transaction feature.
  const factory TransactionState.loading() = _Loading;

  /// The loaded state of the transaction feature.
  ///
  /// Contains a list of [TransactionItemEntity] objects.
  const factory TransactionState.loaded(
    List<TransactionItemEntity> transactions,
  ) = _Loaded;

  /// The error state of the transaction feature.
  ///
  /// Contains an error message.
  const factory TransactionState.error(String message) = _Error;
}
