import 'package:formz/formz.dart';

/// Enum representing the validation errors for the cardholder input.
enum CardholderValidationError {
  /// The input is empty.
  empty('Please select a cardholder');

  const CardholderValidationError(this.message);

  /// The error message associated with the validation error.
  final String message;
}

/// A Formz input model for the cardholder selection field.
class CardholderInput extends FormzInput<String, CardholderValidationError> {
  const CardholderInput.pure() : super.pure('');
  const CardholderInput.dirty([super.value = '']) : super.dirty();

  @override
  CardholderValidationError? validator(String value) {
    if (value.isEmpty) {
      return CardholderValidationError.empty;
    }
    return null;
  }
}
