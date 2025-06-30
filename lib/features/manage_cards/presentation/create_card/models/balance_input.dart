import 'package:formz/formz.dart';

/// Enum representing the validation errors for the balance input.
enum BalanceValidationError {
  /// The input is empty.
  empty('Balance cannot be empty'),

  /// The input is not a valid number.
  invalid('Please enter a valid number'),

  /// The input is outside the allowed range.
  outOfRange('Balance must be between 100 and 1000');

  const BalanceValidationError(this.message);

  /// The error message associated with the validation error.
  final String message;
}

/// A Formz input model for the balance field.
class BalanceInput extends FormzInput<String, BalanceValidationError> {
  const BalanceInput.pure() : super.pure('');
  const BalanceInput.dirty([super.value = '']) : super.dirty();

  @override
  BalanceValidationError? validator(String value) {
    if (value.isEmpty) {
      return BalanceValidationError.empty;
    }
    final balance = int.tryParse(value);
    if (balance == null) {
      return BalanceValidationError.invalid;
    }
    if (balance < 100 || balance > 1000) {
      return BalanceValidationError.outOfRange;
    }
    return null;
  }
}
