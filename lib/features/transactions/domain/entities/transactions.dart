import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

class TransactionsEntity extends Equatable {
  const TransactionsEntity({required this.transactions});

  final List<TransactionItemEntity> transactions;

  @override
  List<Object?> get props => [transactions];
}
