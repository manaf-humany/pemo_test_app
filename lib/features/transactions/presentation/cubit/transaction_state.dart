import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';

part 'transaction_state.freezed.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.loaded(
    List<TransactionItemEntity> transactions,
  ) = _Loaded;
  const factory TransactionState.error(String message) = _Error;
}
