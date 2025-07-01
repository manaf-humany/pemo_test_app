import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A custom dropdown button widget that aligns with the app's design system.
class AppDropdownButton<T> extends StatelessWidget {
  /// Creates an [AppDropdownButton].
  const AppDropdownButton({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.errorText,
  });

  /// The currently selected value.
  final T? value;

  /// The list of items to display in the dropdown.
  final List<DropdownMenuItem<T>> items;

  /// A callback invoked when the user selects an item.
  final ValueChanged<T?>? onChanged;

  /// The text to display as the label.
  final String? labelText;

  /// The text to display as a hint when no value is selected.
  final String? hintText;

  /// The text to display as an error message.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.of(context).color.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.of(context).color.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.of(context).color.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.of(context).color.errorColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
