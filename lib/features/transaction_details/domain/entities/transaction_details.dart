import 'package:equatable/equatable.dart';

/// Represents the detailed information of a single transaction.
///
/// This entity encapsulates all the relevant data for displaying
/// the details of a specific transaction.
class TransactionDetailsEntity extends Equatable {
  const TransactionDetailsEntity({
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

  /// The name or description of the transaction.
  final String name;

  /// The date of the transaction, as a Unix timestamp (seconds since epoch).
  final int date;

  /// The merchant involved in the transaction.
  final String merchant;

  /// The amount billed for the transaction.
  final num billingAmount;

  /// A URL or path to an image associated with the transaction (e.g., merchant logo).
  final String image;

  /// The currency in which the billing amount is expressed.
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
