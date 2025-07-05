import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';
import 'package:uuid/uuid.dart';

/// A cubit responsible for managing the state of the card creation form.
class CreateCardCubit extends Cubit<CreateCardState> {
  CreateCardCubit({required this.createCard, required this.uuid})
      : super(const CreateCardState());

  /// Use case for creating a card.
  final CreateCard createCard;

  /// UUID generator.
  final Uuid uuid;

  void onCardNameChanged(String value) {
    /// Handles changes in the card name input.
    final cardName = CardNameInput.dirty(value);
    Formz.validate(
      [cardName, state.cardholder],
    );
    emit(
      state.copyWith(
        cardName: cardName,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onCardholderChanged(String value) {
    /// Handles changes in the cardholder name input.
    final cardholder = CardholderInput.dirty(value);
    Formz.validate([state.cardName, cardholder]);
    emit(
      state.copyWith(
        cardholder: cardholder,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onBalanceChanged(String value) {
    /// Handles changes in the balance input.
    final balance = BalanceInput.dirty(value);
    emit(state.copyWith(balance: balance));
  }

  void onCardColorChanged(int value) {
    /// Handles changes in the card color input.
    final cardColor = CardColorInput.dirty(value);
    emit(state.copyWith(cardColor: cardColor));
  }

  void onStepTapped(int step) {
    /// Handles tapping on a step in the stepper.
    emit(state.copyWith(currentStep: step));
  }

  void onStepContinue() {
    /// Handles continuing to the next step in the stepper.
    if (state.currentStep < 2) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void onStepCancel() {
    /// Handles canceling and going back to the previous step in the stepper.
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  /// Handles form submission.
  Future<void> onFormSubmitted() async {
    final cardName = CardNameInput.dirty(state.cardName.value);
    final cardholder = CardholderInput.dirty(state.cardholder.value);
    final balance = BalanceInput.dirty(state.balance.value);
    final cardColor = CardColorInput.dirty(state.cardColor.value);

    emit(
      state.copyWith(
        cardName: cardName,
        cardholder: cardholder,
        balance: balance,
        cardColor: cardColor,
      ),
    );

    if (!Formz.validate([cardName, cardholder, balance, cardColor])) {
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final newCard = CardEntity(
      id: uuid.v4(),
      cardName: cardName.value,
      cardholderName: cardholder.value,
      balance: int.parse(balance.value),
      cardColor: cardColor.value!,
    );

    final failureOrSuccess = await createCard(CreateCardParams(card: newCard));

    failureOrSuccess.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: failure.toString(),
        ),
      ),
      (_) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }
}
