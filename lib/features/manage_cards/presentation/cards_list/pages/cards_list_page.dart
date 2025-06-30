import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';
import 'package:pemo_test_project/injection_container.dart';

/// A page that displays a list of the user's created cards.
class CardsListPage extends StatelessWidget {
  const CardsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CardsListCubit>()..loadCards(),
      child: Scaffold(
        appBar: AppPrimaryAppBar(
          title: 'My Cards',
        ),
        body: const _CardsListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(context).push<bool>(
              MaterialPageRoute(
                builder: (_) => const CreateCardPage(),
              ),
            );

            // If a card was created successfully, refresh the list.
            if (result == true && context.mounted) {
              await context.read<CardsListCubit>().loadCards();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _CardsListView extends StatelessWidget {
  const _CardsListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsListCubit, CardsListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (cards) => _LoadedState(cards: cards),
          empty: () => const _EmptyState(),
          error: (message) => AppErrorWidget(
            errorMessage: message,
            onRetryPressed: () => context.read<CardsListCubit>().loadCards(),
          ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.x4),
        child: AppText.bodyLarge(
          'No cards found. Tap the + button to create your first card!',
          align: TextAlign.center,
        ),
      ),
    );
  }
}

class _LoadedState extends StatelessWidget {
  const _LoadedState({required this.cards});

  final List<CardEntity> cards;

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: () async => context.read<CardsListCubit>().loadCards(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.x4),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return _CardListItem(card: card);
        },
      ),
    );
  }
}

class _CardListItem extends StatelessWidget {
  const _CardListItem({required this.card});

  final CardEntity card;

  @override
  Widget build(BuildContext context) {
    final cardColor = Color(card.cardColor);
    final textColor =
        ThemeData.estimateBrightnessForColor(cardColor) == Brightness.dark
            ? Colors.white
            : Colors.black;

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.x4),
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.headingMedium(
            card.cardName,
            color: textColor,
          ),
          const SizedBox(height: AppSpacing.x2),
          AppText.bodyMedium(
            'Holder: ${card.cardholderName}',
            color: textColor.withValues(alpha: 0.8),
          ),
          const SizedBox(height: AppSpacing.x4),
          Align(
            alignment: Alignment.bottomRight,
            child: AppText.headingSmall(
              'Balance: \$${card.balance}',
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
