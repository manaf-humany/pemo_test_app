import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';

class TransactionDetailsModel extends TransactionDetails {
  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      date: DateTime.parse(
        json['date'] as String,
      ), // Assumes ISO 8601 date string
      merchant: json['merchant'] as String,
      billingAmount: json['billingAmount'] as num,
      image: json['image'] as String,
      billingCurrency: json['billingCurrency'] as String,
    );
  }
  const TransactionDetailsModel({
    required super.id,
    required super.name,
    required super.date,
    required super.merchant,
    required super.billingAmount,
    required super.image,
    required super.billingCurrency,
  });
}
