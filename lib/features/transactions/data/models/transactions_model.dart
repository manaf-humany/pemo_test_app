import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/transactions/data/models/transaction_item_model.dart';

part 'transactions_model.freezed.dart';
part 'transactions_model.g.dart';

@freezed
@HiveType(typeId: 1)
class TransactionsModel with _$TransactionsModel {
  const factory TransactionsModel({
    @HiveField(0) required List<TransactionItemModel> transactions,
  }) = _TransactionsModel;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);
}
