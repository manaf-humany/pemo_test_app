import 'package:formz/formz.dart';

/// Enum representing the validation errors for the card color input.
enum CardColorValidationError {
  /// No color has been selected.
  empty('Please select a card color');

  const CardColorValidationError(this.message);

  /// The error message associated with the validation error.
  final String message;
}

/// A Formz input model for the card color selection field.
class CardColorInput extends FormzInput<int?, CardColorValidationError> {
  const CardColorInput.pure() : super.pure(null);
  const CardColorInput.dirty([super.value]) : super.dirty();

  @override
  CardColorValidationError? validator(int? value) {
    if (value == null) {
      return CardColorValidationError.empty;
    }
    return null;
  }
}
