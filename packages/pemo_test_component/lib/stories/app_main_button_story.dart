import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppMainButton].
///
/// This story allows you to interactively test the [AppMainButton]
/// with different properties like title, colors, and states.
class AppMainButtonStory extends Story {
  /// Creates a story for the [AppMainButton].
  AppMainButtonStory()
      : super(
          name: 'Widgets/AppMainButton',
          builder: (context) {
            final title =
                context.knobs.text(label: 'Title', initial: 'Press Me');

            final showProgress = context.knobs.boolean(
              label: 'Show Progress',
              initial: false,
            );

            final isEnabled = context.knobs.boolean(
              label: 'Enabled',
              initial: true,
            );

            final withIcon = context.knobs.boolean(
              label: 'With Icon',
              initial: false,
              description: 'Shows a placeholder icon when enabled.',
            );

            final colors = AppTheme.of(context).color;

            final backgroundColor = context.knobs.options(
              label: 'Background Color',
              initial: colors.primaryColor,
              options: [
                Option(label: 'Primary', value: colors.primaryColor),
                Option(label: 'Secondary', value: colors.secondaryColor),
                Option(label: 'Transparent', value: Colors.transparent),
              ],
            );

            final foregroundColor = context.knobs.options(
              label: 'Foreground Color',
              initial: colors.mainTextColor,
              options: [
                Option(label: 'Main Text', value: colors.mainTextColor),
                Option(label: 'Primary', value: colors.primaryColor),
                Option(label: 'Secondary', value: colors.secondaryColor),
              ],
            );

            final borderColor = context.knobs.options(
              label: 'Border Color',
              initial: null,
              options: [
                const Option(label: 'None', value: null),
                Option(label: 'Primary', value: colors.primaryColor),
                Option(label: 'Secondary', value: colors.secondaryColor),
              ],
            );

            return SizedBox(
              height: 56,
              child: AppMainButton(
                title: title,
                onTap: isEnabled ? () {} : null,
                showProgress: showProgress,
                backgroundColor: backgroundColor,
                icon: withIcon ? Assets.svgs.placeHolder : null,
                foregroundColor: foregroundColor,
                borderColor: borderColor,
              ),
            );
          },
        );
}
