import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

part 'create_card_state.freezed.dart';

/// Represents the state of the card creation process.
@freezed
class CreateCardState with _$CreateCardState {
  const factory CreateCardState({
    /// The input for the card name.
    @Default(CardNameInput.pure()) CardNameInput cardName,

    /// The input for the cardholder name.
    @Default(CardholderInput.pure()) CardholderInput cardholder,

    /// The input for the card balance.
    @Default(BalanceInput.pure()) BalanceInput balance,

    /// The input for the card color.
    @Default(CardColorInput.pure()) CardColorInput cardColor,

    /// The submission status of the form.
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,

    /// The current step in the card creation process.
    @Default(0) int currentStep,

    /// An optional error message if form submission fails.
    String? errorMessage,
  }) = _CreateCardState;
}
