import 'package:formz/formz.dart';

/// Enum representing the validation errors for the card name input.
enum CardNameValidationError {
  /// The input is empty.
  empty('Card name cannot be empty'),

  /// The input is too short.
  tooShort('Card name must be at least 3 characters long'),

  /// The input contains invalid characters.
  invalidCharacters('Card name can only contain English letters and spaces');

  const CardNameValidationError(this.message);

  /// The error message associated with the validation error.
  final String message;
}

/// A Formz input model for the card name field.
class CardNameInput extends FormzInput<String, CardNameValidationError> {
  const CardNameInput.pure() : super.pure('');
  const CardNameInput.dirty([super.value = '']) : super.dirty();

  static final _nameRegex = RegExp(r'^[a-zA-Z\s]+$');

  @override
  CardNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return CardNameValidationError.empty;
    }
    if (value.length < 3) {
      return CardNameValidationError.tooShort;
    }
    if (!_nameRegex.hasMatch(value)) {
      return CardNameValidationError.invalidCharacters;
    }
    return null;
  }
}
