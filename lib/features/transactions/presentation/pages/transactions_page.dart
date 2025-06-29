import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/pages/transaction_details_page.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_state.dart';
import 'package:pemo_test_project/features/transactions/presentation/widgets/transaction_item_widget.dart';
import 'package:pemo_test_project/injection_container.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: BlocProvider(
        create: (context) => sl<TransactionCubit>()..fetchTransactions(),
        child: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildLoadingSkeleton(),
              loading: () => _buildLoadingSkeleton(),
              loaded: (transactions) {
                return _buildLoadedWidget(context, transactions);
              },
              error: (message) => _buildErrorWidget(message, context),
            );
          },
        ),
      ),
    );
  }

  AppErrorWidget _buildErrorWidget(String message, BuildContext context) {
    return AppErrorWidget(
      errorMessage: message,
      onRetryPressed:
          () => context.read<TransactionCubit>().fetchTransactions(),
    );
  }

  AppRefreshIndicator _buildLoadedWidget(
    BuildContext context,
    List<TransactionItemEntity> transactions,
  ) {
    return AppRefreshIndicator(
      onRefresh:
          () async => context.read<TransactionCubit>().fetchTransactions(),
      child:
          transactions.isEmpty
              ? AppEmptyWidget(
                title: 'No Transactions Found',
                content: 'When you make a transaction, it will appear here.',
              )
              : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return TransactionItemWidget(
                    transaction: transaction,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) => TransactionDetailsPage(
                                transactionId: transaction.id,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return SkeletonLoadingWidget(
      enabled: true,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TransactionItemWidget(
            transaction: TransactionItemEntity(
              id: '1',
              name: 'Placeholder Transaction',
              date: DateTime.now(),
              merchant: 'Placeholder Merchant',
              billingAmount: 100.00,
              image: '',
              billingCurrency: 'USD',
            ),
          );
        },
      ),
    );
  }
}
