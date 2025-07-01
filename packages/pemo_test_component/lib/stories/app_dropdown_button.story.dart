import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AppDropdownButtonStory extends Story {
  AppDropdownButtonStory()
      : super(
          name: 'Widgets/AppDropdownButton',
          builder: (context) {
            final labelText = context.knobs.text(
              label: 'Label Text',
              initial: 'Cardholder',
            );

            final hintText = context.knobs.text(
              label: 'Hint Text',
              initial: 'Select a cardholder',
            );

            final errorText = context.knobs.text(
              label: 'Error Text',
              initial: '',
            );

            final items = ['Alice', 'Bob', 'Charlie', 'David'];
            final selectedValue = context.knobs.options<String?>(
              label: 'Selected Value',
              initial: null,
              options: [
                const Option(label: 'None', value: null),
                ...items.map((e) => Option(label: e, value: e)),
              ],
            );

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(AppSpacing.x4),
                child: Center(
                  child: AppDropdownButton<String>(
                    labelText: labelText,
                    hintText: hintText,
                    errorText: errorText.isNotEmpty ? errorText : null,
                    value: selectedValue,
                    items: items
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: AppText.bodyMedium(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ),
            );
          },
        );
}
