import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

part 'cards_list_state.freezed.dart';

@freezed
sealed class CardsListState with _$CardsListState {
  /// The initial state before any action has been taken.
  const factory CardsListState.initial() = _Initial;

  /// The state when the list of cards is being loaded.
  const factory CardsListState.loading() = _Loading;

  /// The state when the list of cards has been successfully loaded.
  const factory CardsListState.loaded(List<CardEntity> cards) = _Loaded;

  /// The state when there are no cards to display.
  const factory CardsListState.empty() = _Empty;

  /// The state when an error has occurred.
  const factory CardsListState.error(String message) = _Error;
}
