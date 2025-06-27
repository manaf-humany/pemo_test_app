import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_state.dart';
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
            return FlutterLogo();
            // return state.when(
            //   initial: () => const Center(child: Text('Initializing...')),
            //   loading: () => const Center(child: CircularProgressIndicator()),
            //   loaded: (transactions) {
            //     if (transactions.isEmpty) {
            //       return const Center(child: Text('No transactions found.'));
            //     }
            //     return ListView.builder(
            //       itemCount: transactions.length,
            //       itemBuilder: (context, index) {
            //         final transaction = transactions[index];
            //         return ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: NetworkImage(transaction.image),
            //             onBackgroundImageError: (_, __) {},
            //           ),
            //           title: Text(transaction.name),
            //           subtitle: Text(transaction.merchant),
            //           trailing: Text(
            //             '${transaction.billingAmount} ${transaction.billingCurrency}',
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           onTap: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (_) => TransactionDetailsPage(transactionId: transaction.id),
            //               ),
            //             );
            //           },
            //         );
            //       },
            //     );
            //   },
            //   error: (message) => Center(
            //     child: Text(message, style: const TextStyle(color: Colors.red)),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
