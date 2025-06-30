import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    required this.card,
    super.key,
  });

  final CardEntity card;

  @override
  Widget build(BuildContext context) {
    final cardColor = Color(card.cardColor);
    final textColor =
        ThemeData.estimateBrightnessForColor(cardColor) == Brightness.dark
            ? Colors.white
            : Colors.black;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.x4),
      padding: const EdgeInsets.all(AppSpacing.x5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cardColor, cardColor.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.x4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headingMedium(
                card.cardName,
                color: textColor,
              ),
              Icon(
                Icons.memory, // Chip icon
                color: textColor.withValues(alpha: 0.8),
                size: 32,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.x6),
          AppText.bodyMedium(
            'CARD HOLDER',
            color: textColor.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppSpacing.x1),
          AppText.bodyLarge(
            card.cardholderName,
            color: textColor,
          ),
          const SizedBox(height: AppSpacing.x4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.x1,
                children: [
                  AppText.bodyMedium(
                    'BALANCE',
                    color: textColor.withValues(alpha: 0.7),
                  ),
                  AppText.headingSmall(
                    '\$${card.balance.toStringAsFixed(2)}',
                    color: textColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
