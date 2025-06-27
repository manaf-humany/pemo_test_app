import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';

class TransactionItemModel extends TransactionItemEntity {
  const TransactionItemModel({
    required super.id,
    required super.name,
    required super.date,
    required super.merchant,
    required super.billingAmount,
    required super.image,
    required super.billingCurrency,
  });

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) {
    return TransactionItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      merchant: json['merchant'] as String,
      billingAmount: json['billingAmount'] as num,
      image: json['image'] as String,
      billingCurrency:
          (json['billingCurrency'] ?? json['billing_currency']) as String,
    );
  }
}
