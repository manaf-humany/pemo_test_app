import 'package:equatable/equatable.dart';

/// Represents the detailed information of a single transaction.
class TransactionDetailsEntity extends Equatable {
  const TransactionDetailsEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.merchant,
    required this.billingAmount,
    required this.image,
    required this.billingCurrency,
    required this.currencySymbol,
  });

  final String id;
  final String name;

  /// The date of the transaction, as a Unix timestamp (seconds since epoch).
  final int date;
  final String merchant;
  final num billingAmount;
  final String image;
  final String billingCurrency;

  /// The currency symbol (e.g., '$', '€').
  final String currencySymbol;

  @override
  List<Object?> get props => [
        id,
        name,
        date,
        merchant,
        billingAmount,
        image,
        billingCurrency,
        currencySymbol,
      ];
}
