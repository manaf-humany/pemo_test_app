import 'package:equatable/equatable.dart';

/// Represents a single transaction item.
class TransactionItemEntity extends Equatable {
  /// Creates a [TransactionItemEntity].
  const TransactionItemEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.merchant,
    required this.billingAmount,
    required this.image,
    required this.billingCurrency,
  });

  /// The unique identifier of the transaction.
  final String id;

  /// The name of the transaction.
  final String name;

  /// The date of the transaction, represented as a Unix timestamp (milliseconds since epoch).
  final int date;

  /// The merchant involved in the transaction.
  final String merchant;

  /// The billing amount of the transaction.
  final num billingAmount;

  /// The URL or path to an image associated with the transaction.
  final String image;

  /// The currency used for billing.
  final String billingCurrency;

  @override
  List<Object?> get props => [
        id,
        name,
        date,
        merchant,
        billingAmount,
        image,
        billingCurrency,
      ];
}
