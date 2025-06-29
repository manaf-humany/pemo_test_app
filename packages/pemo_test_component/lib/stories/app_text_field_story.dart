import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppTextField] widget.
///
/// This story allows you to interactively test the [AppTextField]
/// with different configurations and states.
class AppTextFieldStory extends Story {
  /// Creates a story for the [AppTextField].
  AppTextFieldStory()
    : super(
        name: 'Widgets/AppTextField',
        builder: (context) {
          final hint = context.knobs.text(
            label: 'Hint Text',
            initial: 'Enter your text here...',
          );

          final labelText = context.knobs.text(
            label: 'Label Text',
            initial: 'Username',
          );

          final helperText = context.knobs.text(
            label: 'Helper Text',
            initial: 'This is a helper text.',
          );

          final isEnabled = context.knobs.boolean(
            label: 'Enabled',
            initial: true,
          );

          final isInline = context.knobs.boolean(
            label: 'Inline Label/Helper',
            initial: true,
          );

          final obscureText = context.knobs.boolean(
            label: 'Obscure Text',
            initial: false,
          );

          final withIcons = context.knobs.boolean(
            label: 'With Icons',
            initial: true,
          );

          final state = context.knobs.options(
            label: 'State',
            initial: InputState.defaultState,
            options: const [
              Option(label: 'Default', value: InputState.defaultState),
              Option(label: 'Disabled', value: InputState.disabledState),
              Option(label: 'Danger', value: InputState.dangerState),
            ],
          );

          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.x4),
                child: AppTextField(
                  hint: hint,
                  labelText: labelText,
                  helperText: helperText,
                  isEnabled: isEnabled,
                  isInline: isInline,
                  obscureText: obscureText,
                  state: state,
                  prefixIcon:
                      withIcons
                          ? AppSvgPicture.asset(Assets.svgs.placeHolder)
                          : null,
                  suffixIcon:
                      withIcons
                          ? AppSvgPicture.asset(Assets.svgs.placeHolder)
                          : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty.';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
              ),
            ),
          );
        },
      );
}
