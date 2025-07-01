import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/currency/currency.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays the total spent amount in a styled card.
///
/// This widget listens to the [CurrencyCubit] to get the state of the
/// total spent calculation and renders the UI accordingly. It handles loading,
/// error, and loaded states automatically.
class TotalSpentCard extends StatelessWidget {
  /// Creates a [TotalSpentCard].
  const TotalSpentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.x4,
        AppSpacing.x4,
        AppSpacing.x4,
        0,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.x2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.x4),
          border: Border.all(color: theme.color.borderColor),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.color.surfaceColor,
              theme.color.primaryColor.withValues(alpha: .5),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: theme.color.primaryColor,
                    size: 20,
                  ),
                  AppSpacing.h2,
                  AppText.bodyMedium(
                    'Total Spent (USD)',
                    color: theme.color.secondTextColor,
                  ),
                ],
              ),
              AppSpacing.v2,
              BlocBuilder<CurrencyCubit, CurrencyState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const _ShimmerLoading(),
                    loading: () => const _ShimmerLoading(),
                    loaded: (totalSpent) => AppText.headingMedium(
                      '\$${totalSpent.toStringAsFixed(2)}',
                    ),
                    error: (message) => OneLineErrorWidget(
                      errorMessage: message,
                      onRetryPressed: () =>
                          context.read<CurrencyCubit>().getTotalSpent,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShimmerLoading extends StatelessWidget {
  const _ShimmerLoading();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.color.shimmerBaseColor,
      highlightColor: theme.color.shimmerHighlightColor,
      child: Container(
        width: 150,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.x2),
        ),
      ),
    );
  }
}
