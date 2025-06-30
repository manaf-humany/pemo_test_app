import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// A widget that displays a skeleton loading animation for the cards list.
class CardsListLoadingWidget extends StatelessWidget {
  /// Creates a [CardsListLoadingWidget].
  const CardsListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSkeletonLoadingWidget(
      child: AnimationLimiter(
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.x4),
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: CardItemWidget(
                    // fake data
                    card: CardEntity(
                      id: '3',
                      cardName: 'cardName',
                      cardholderName: 'cardholderName',
                      balance: 111,
                      cardColor: 2,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
