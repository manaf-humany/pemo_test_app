import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';

part 'transaction_details_state.freezed.dart';

@freezed
abstract class TransactionDetailsState with _$TransactionDetailsState {
  const factory TransactionDetailsState.initial() = _Initial;
  const factory TransactionDetailsState.loading() = _Loading;
  const factory TransactionDetailsState.loaded({
    required TransactionDetails transaction,
  }) = _Loaded;
  const factory TransactionDetailsState.error({required String message}) =
      _Error;
}
