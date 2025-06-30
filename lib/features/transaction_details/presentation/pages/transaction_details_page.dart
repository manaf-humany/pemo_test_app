import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transaction_details/domain/entities/transaction_details.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/cubit/transaction_details_cubit.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/cubit/transaction_details_state.dart';
import 'package:pemo_test_project/injection_container.dart';

/// A page that displays the detailed information of a single transaction.
class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({required this.transactionId, super.key});

  /// The unique identifier of the transaction to display.
  final String transactionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TransactionDetailsCubit>()..fetchTransactionDetails(transactionId),
      child: const _TransactionDetailsView(),
    );
  }
}

/// The main view for the transaction details, handling the UI based on the state.
class _TransactionDetailsView extends StatelessWidget {
  const _TransactionDetailsView();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppText.headingMedium('Transaction Details'),
        centerTitle: true,
        backgroundColor: theme.color.primaryColor,
        elevation: 0,
      ),
      body: BlocBuilder<TransactionDetailsCubit, TransactionDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingState(context),
            loading: () => _buildLoadingState(context),
            loaded: (transaction) => _buildLoadedState(context, transaction),
            error: (message) => _buildErrorState(context, message),
          );
        },
      ),
    );
  }

  /// Builds the loading state UI with a shimmer effect.
  Widget _buildLoadingState(BuildContext context) {
    return SkeletonLoadingWidget(
      enabled: true,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(AppSpacing.x4),
        child: Column(
          spacing: AppSpacing.x4,
          children: [
            CircleAvatar(
              radius: AppSpacing.x12,
              backgroundColor: AppTheme.of(context).color.shimmerBaseColor,
            ),
            _SkeletonBox(width: AppSpacing.x5 * 15, height: AppSpacing.x5),
            _SkeletonBox(width: AppSpacing.x5 * 20, height: AppSpacing.x5),
            _SkeletonBox(width: AppSpacing.x5 * 15, height: AppSpacing.x5),
            _SkeletonBox(height: AppSpacing.x5 * 15),
          ],
        ),
      ),
    );
  }

  /// Builds the UI when the transaction data has been successfully loaded.
  Widget _buildLoadedState(
    BuildContext context,
    TransactionDetailsEntity transaction,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.x4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TransactionHeader(transaction: transaction),
          const SizedBox(height: AppSpacing.x6),
          _TransactionInfoCard(transaction: transaction),
        ],
      ),
    );
  }

  /// Builds the error state UI with a message and a retry button.
  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: AppErrorWidget(
        errorMessage: message,
        onRetryPressed: () {
          final transactionId =
              context.read<TransactionDetailsCubit>().transactionId;
          if (transactionId != null) {
            context
                .read<TransactionDetailsCubit>()
                .fetchTransactionDetails(transactionId);
          }
        },
      ),
    );
  }
}

/// A box used as a placeholder in the skeleton loading UI.
class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? AppSpacing.x4,
      decoration: BoxDecoration(
        color: AppTheme.of(context).color.shimmerBaseColor,
        borderRadius: BorderRadius.circular(AppSpacing.x1),
      ),
    );
  }
}

/// Displays the main header of the transaction details screen.
class _TransactionHeader extends StatelessWidget {
  const _TransactionHeader({required this.transaction});
  final TransactionDetailsEntity transaction;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final formattedAmount = NumberFormat.currency(
      locale: 'en_US',
      symbol: transaction.currencySymbol,
    ).format(transaction.billingAmount);

    return Column(
      children: [
        AppNetworkImage(
          url: transaction.image,
          width: AppSpacing.x10 * 2.5,
          height: AppSpacing.x10 * 2.5,
          shape: ImageShape.circle,
          useCache: true,
        ),
        const SizedBox(height: AppSpacing.x4),
        AppText.headingMedium(transaction.name, align: TextAlign.center),
        const SizedBox(height: AppSpacing.x1),
        AppText.bodyLarge(
          formattedAmount,
          color: theme.color.greenColor,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

/// A card that displays the detailed information of the transaction.
class _TransactionInfoCard extends StatelessWidget {
  const _TransactionInfoCard({required this.transaction});
  final TransactionDetailsEntity transaction;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMMM d, yyyy, h:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(transaction.date * 1000));

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.headingMedium('Details', fontWeight: FontWeight.bold),
          const Divider(height: AppSpacing.x4),
          _DetailRow(
            icon: Icons.store_mall_directory,
            label: 'Merchant',
            value: transaction.merchant,
          ),
          const Divider(height: AppSpacing.x4),
          _DetailRow(
            icon: Icons.receipt_long,
            label: 'Billing Amount',
            value: '${transaction.billingAmount} ${transaction.currencySymbol}',
          ),
          const Divider(height: AppSpacing.x4),
          _DetailRow(
            icon: Icons.calendar_today,
            label: 'Date & Time',
            value: formattedDate,
          ),
        ],
      ),
    );
  }
}

/// A row in the details card, displaying a piece of information with an icon.
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.x2),
      child: Row(
        children: [
          Icon(icon, color: theme.color.secondaryColor, size: AppIconSize.x5),
          const SizedBox(width: AppSpacing.x4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyMedium(label, color: theme.color.secondaryColor),
                const SizedBox(height: 2),
                AppText.bodyLarge(value, fontWeight: FontWeight.w500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
