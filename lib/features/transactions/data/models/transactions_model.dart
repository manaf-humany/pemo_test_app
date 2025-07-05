import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

part 'transactions_model.freezed.dart';
part 'transactions_model.g.dart';

/// Transactions model for storing data in Hive and interacting with API.
@freezed
@HiveType(typeId: 1)
class TransactionsModel with _$TransactionsModel {
  const factory TransactionsModel({
    /// List of transaction items.
    @HiveField(0) required List<TransactionItemModel> transactions,
  }) = _TransactionsModel;

  /// Creates a [TransactionsModel] from a JSON object.
  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);
}

/// Extension methods for [TransactionsModel].
extension TransactionsModelX on TransactionsModel {
  /// Converts a [TransactionsModel] to a [TransactionsEntity].
  TransactionsEntity toEntity() {
    return TransactionsEntity(
      // ignore: cascade_invocations
      transactions: transactions.map((model) => model.toEntity()).toList(),
    );
  }
}
