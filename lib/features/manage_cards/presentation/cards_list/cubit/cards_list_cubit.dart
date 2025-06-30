import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// A cubit responsible for managing the state of the cards list screen.
class CardsListCubit extends Cubit<CardsListState> {
  CardsListCubit({required this.getCards})
      : super(const CardsListState.initial());

  final GetCards getCards;

  /// Loads the list of saved cards.
  ///
  /// Emits [CardsListState.loading] while fetching, then either
  /// [CardsListState.loaded] with the data, [CardsListState.empty] if no cards
  /// are found, or [CardsListState.error] if an error occurs.
  Future<void> loadCards() async {
    emit(const CardsListState.loading());
    final failureOrCards = await getCards(NoParams());
    failureOrCards.fold(
      (failure) => emit(CardsListState.error(failure.toString())),
      (cards) {
        if (cards.isEmpty) {
          emit(const CardsListState.empty());
        } else {
          emit(CardsListState.loaded(cards));
        }
      },
    );
  }
}
