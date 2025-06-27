import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pemo_test_project/features/transactions/data/models/transaction_item_model.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transactions.dart';

part 'transactions_model.freezed.dart';

class TransactionsModel extends TransactionsEntity {
  const TransactionsModel({required super.transactions});

  factory TransactionsModel.fromJson(List<Map<String, dynamic>> json) {
    final List<TransactionItemModel> parsedTransactionItems =
        json.map((itemJson) {
          return TransactionItemModel.fromJson(itemJson);
        }).toList();

    return TransactionsModel(transactions: parsedTransactionItems);
  }
}
