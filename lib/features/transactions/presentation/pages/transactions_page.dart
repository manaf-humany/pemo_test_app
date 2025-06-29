import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/pages/transaction_details_page.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_state.dart';
import 'package:pemo_test_project/features/transactions/presentation/widgets/transaction_item_widget.dart';
import 'package:pemo_test_project/injection_container.dart';

/// A page that displays a list of transactions.
///
/// This page uses a [TransactionCubit] to fetch and manage the state of the
/// transactions. It displays a loading skeleton while data is being fetched,
/// an error widget if the fetch fails, an empty widget if there are no
/// transactions, and a list of [TransactionItemWidget]s when the data is
/// successfully loaded.
class TransactionsPage extends StatelessWidget {
  /// Creates a [TransactionsPage].
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

  /// Builds the error widget to be displayed when the transaction fetch fails.
  AppErrorWidget _buildErrorWidget(String message, BuildContext context) {
    return AppErrorWidget(
      errorMessage: message,
      onRetryPressed:
          () => context.read<TransactionCubit>().fetchTransactions(),
    );
  }

  /// Builds the widget to be displayed when the transactions are loaded.
  ///
  /// This includes a refresh indicator and handles both the empty and data states.
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

  /// Builds the skeleton loading widget to be displayed while transactions are being fetched.
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
