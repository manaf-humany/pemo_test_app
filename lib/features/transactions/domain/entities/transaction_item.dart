import 'package:equatable/equatable.dart';

class TransactionItemEntity extends Equatable {
  const TransactionItemEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.merchant,
    required this.billingAmount,
    required this.image,
    required this.billingCurrency,
  });
  final String id;
  final String name;
  final DateTime date;
  final String merchant;
  final num billingAmount;
  final String image;
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
