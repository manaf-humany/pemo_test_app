import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

part 'create_card_state.freezed.dart';

@freezed
class CreateCardState with _$CreateCardState {
  const factory CreateCardState({
    @Default(CardNameInput.pure()) CardNameInput cardName,
    @Default(CardholderInput.pure()) CardholderInput cardholder,
    @Default(BalanceInput.pure()) BalanceInput balance,
    @Default(CardColorInput.pure()) CardColorInput cardColor,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(0) int currentStep,
    String? errorMessage,
  }) = _CreateCardState;
}
