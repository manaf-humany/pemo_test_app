import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transaction_details/transaction_details.dart';

/// A widget that displays the detailed information of a transaction.
///
/// This widget is designed to be used on a dedicated screen to show all
/// the details of a single transaction.
class TransactionDetailsWidget extends StatelessWidget {
  /// Creates a [TransactionDetailsWidget].
  ///
  /// The [transaction] parameter must not be null.
  const TransactionDetailsWidget({required this.transaction, super.key});

  /// The transaction details to display.
  final TransactionDetailsEntity transaction;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final formattedDate = DateFormat(
      'E, MMM d, yyyy • hh:mm a',
    ).format(DateTime.fromMillisecondsSinceEpoch(transaction.date));

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.x6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with amount
          Center(
            child: Column(
              children: [
                AppText.bodyMedium(
                  'Transaction Amount',
                  color: theme.color.secondTextColor,
                ),
                AppSpacing.h2,
                AppText.headingLarge(
                  '${transaction.billingAmount.toStringAsFixed(2)} ${transaction.billingCurrency}',
                  color: transaction.billingAmount.isNegative
                      ? theme.color.errorColor
                      : theme.color.mainTextColor,
                ),
              ],
            ),
          ),
          AppSpacing.h12,

          // Merchant Info
          _buildDetailSection(
            theme: theme,
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppRadius.x8,
                  backgroundImage: NetworkImage(transaction.image),
                  backgroundColor: theme.color.greyScaffoldBGColor,
                ),
                AppSpacing.h4,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.bodyLargeStrong(transaction.name),
                      AppSpacing.h1,
                      AppText.bodyMedium(
                        transaction.merchant,
                        color: theme.color.secondTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.h6,

          // Date Info
          _buildDetailSection(
            theme: theme,
            child: _buildDetailRow(
              theme: theme,
              label: 'Date',
              value: formattedDate,
            ),
          ),
          AppSpacing.h6,

          // Transaction ID
          _buildDetailSection(
            theme: theme,
            child: _buildDetailRow(
              theme: theme,
              label: 'Transaction ID',
              value: transaction.id,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection({required AppTheme theme, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.x4),
      decoration: BoxDecoration(
        color: theme.color.greyScaffoldBGColor,
        borderRadius: BorderRadius.circular(AppRadius.x4),
        border: Border.all(color: theme.color.borderColor),
      ),
      child: child,
    );
  }

  Widget _buildDetailRow({
    required AppTheme theme,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.bodyMedium(label, color: theme.color.secondTextColor),
        Expanded(child: AppText.bodyMediumStrong(value, align: TextAlign.end)),
      ],
    );
  }
}
