import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/cubit/transaction_details_cubit.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/cubit/transaction_details_state.dart';
import 'package:pemo_test_project/injection_container.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({required this.transactionId, super.key});
  final String transactionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Details')),
      body: BlocProvider(
        create:
            (context) =>
                sl<TransactionDetailsCubit>()
                  ..fetchTransactionDetails(transactionId),
        child: BlocBuilder<TransactionDetailsCubit, TransactionDetailsState>(
          builder: (context, state) {
            return FlutterLogo();
            // return state.when(
            //   initial: () => const Center(child: Text('Initializing...')),
            //   loading: () => const Center(child: CircularProgressIndicator()),
            //   loaded: (transaction) {
            //     return Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Center(
            //             child: CircleAvatar(
            //               radius: 50,
            //               backgroundImage: NetworkImage(transaction.image),
            //               onBackgroundImageError: (_, __) {},
            //             ),
            //           ),
            //           const SizedBox(height: 20),
            //           Text('Name: ${transaction.name}', style: Theme.of(context).textTheme.headline6),
            //           const SizedBox(height: 10),
            //           Text('Merchant: ${transaction.merchant}', style: Theme.of(context).textTheme.subtitle1),
            //           const SizedBox(height: 10),
            //           Text('Amount: ${transaction.billingAmount} ${transaction.billingCurrency}', style: Theme.of(context).textTheme.subtitle1),
            //           const SizedBox(height: 10),
            //           Text('Original Amount: ${transaction.originalAmount} ${transaction.originalCurrency}', style: Theme.of(context).textTheme.subtitle1),
            //           const SizedBox(height: 10),
            //           Text('Date: ${transaction.date}', style: Theme.of(context).textTheme.subtitle1),
            //         ],
            //       ),
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
