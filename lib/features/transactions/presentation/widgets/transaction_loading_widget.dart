import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transactions/transactions.dart';
import 'package:shimmer/shimmer.dart';

class TransactionsLoadingWidget extends StatelessWidget {
  const TransactionsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonLoadingWidget(
      enabled: true,
      child: CustomScrollView(
        physics:
            const NeverScrollableScrollPhysics(), // Disable scrolling for skeleton
        slivers: [
          // The TotalSpentCard will show its own skeleton state
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.x4,
                AppSpacing.x4,
                AppSpacing.x4,
                0,
              ),
              child: Shimmer.fromColors(
                baseColor: AppTheme.of(context).color.shimmerBaseColor,
                highlightColor:
                    AppTheme.of(context).color.shimmerHighlightColor,
                child: Container(
                  height: AppSpacing.x16,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.x2),
                  ),
                ),
              ),
            ),
          ),
          // Placeholder for the search bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.x4,
                AppSpacing.x4,
                AppSpacing.x4,
                0,
              ),
              child: Shimmer.fromColors(
                baseColor: AppTheme.of(context).color.shimmerBaseColor,
                highlightColor:
                    AppTheme.of(context).color.shimmerHighlightColor,
                child: Container(
                  height: 56, // Standard height for a text field
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.x2),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.x4)),
          // Placeholder for the transaction list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // This Padding mimics the spacing of the real list items
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x4)
                      .copyWith(bottom: AppSpacing.x4),
                  child: TransactionItemWidget(
                    transaction: TransactionItemEntity(
                      id: '1',
                      name: 'Placeholder Transaction',
                      date: 1739259074,
                      merchant: 'Placeholder Merchant',
                      billingAmount: 100.00,
                      image: 'https://via.placeholder.com/150',
                      billingCurrency: 'USD',
                    ),
                  ),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
