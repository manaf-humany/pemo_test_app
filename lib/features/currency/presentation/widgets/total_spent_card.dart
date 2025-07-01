import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/currency/currency.dart';

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
      child: AppCard(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.x4),
        ),
        color: theme.color.primaryColor.withValues(alpha: .5),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bodyMedium(
                'Total Spent (USD)',
                color: theme.color.secondTextColor,
              ),
              AppSpacing.v2,
              BlocBuilder<CurrencyCubit, CurrencyState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => AppText.headingMedium(
                      '...',
                    ),
                    loading: () => AppText.headingMedium('Calculating...'),
                    loaded: (totalSpent) => AppText.headingMedium(
                      '\$${totalSpent.toStringAsFixed(2)}',
                    ),
                    error: (message) => AppText.headingMedium(
                      'Error $message',
                      color: theme.color.errorColor,
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
