import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';

/// A widget that displays a single transaction item in a list.
///
/// This widget is designed to be used in a `ListView` to show a summary
/// of a transaction. It displays the merchant's image, the transaction name,
/// the merchant name, the date, and the billing amount.
class TransactionItemWidget extends StatelessWidget {
  /// Creates a [TransactionItemWidget].
  ///
  /// The [transaction] parameter must not be null.
  const TransactionItemWidget({
    required this.transaction,
    this.onTap,
    super.key,
  });

  /// The transaction data to display.
  final TransactionItemEntity transaction;

  /// An optional callback that is called when the widget is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final formattedDate = DateFormat('MMM d, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(transaction.date * 1000));

    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSpacing.x16,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x4,
          vertical: AppSpacing.x3,
        ),
        child: Row(
          children: [
            // Merchant Image
            AppNetworkImage(
              url: transaction.image,
              useCache: true,
              shape: ImageShape.circle,
              width: AppSpacing.x10,
              height: AppSpacing.x10,
              fit: BoxFit.cover,
            ),
            AppSpacing.h3,
            // Transaction Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyMediumStrong(
                    transaction.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacing.h1,
                  AppText.bodySmall(
                    '${transaction.merchant} • $formattedDate',
                    color: theme.color.secondTextColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            AppSpacing.h4,
            // Amount
            AppText.bodyMediumStrong(
              '${transaction.billingAmount.toStringAsFixed(2)} ${transaction.billingCurrency}',
              color: transaction.billingAmount.isNegative
                  ? theme.color.errorColor
                  : theme.color.mainTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
