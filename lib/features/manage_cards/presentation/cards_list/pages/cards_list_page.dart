import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
          initial: () => const CardsListLoadingWidget(),
          loading: () => const CardsListLoadingWidget(),
          loaded: (cards) => _LoadedState(cards: cards),
          empty: () => AppEmptyWidget(
            title: 'No cards found. ',
            content: 'Tap the + button to create your first card!',
          ),
          error: (message) => AppErrorWidget(
            errorMessage: message,
            onRetryPressed: () => context.read<CardsListCubit>().loadCards(),
          ),
        );
      },
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
      child: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.x4),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: CardItemWidget(card: card),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
