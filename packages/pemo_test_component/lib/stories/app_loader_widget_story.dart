import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppLoaderWidget].
///
/// This story allows you to interactively test the [AppLoaderWidget]
/// with different inputs for size, color, and stroke width.
class AppLoaderWidgetStory extends Story {
  /// Creates a story for the [AppLoaderWidget].
  AppLoaderWidgetStory()
      : super(
          name: 'Widgets/AppLoaderWidget',
          builder: (context) {
            final loadingSize = context.knobs.slider(
              label: 'Loading Size',
              initial: 32,
              min: 16,
              max: 128,
              description: 'The size (width and height) of the loader.',
            );

            final strokeWidth = context.knobs.slider(
              label: 'Stroke Width',
              initial: 3,
              min: 1,
              max: 10,
              description: 'The thickness of the loader\'s circular line.',
            );

            final loadingColor = context.knobs.options(
              label: 'Loading Color',
              initial: AppTheme.of(context).color.primaryColor,
              options: [
                Option(
                  label: 'Primary',
                  value: AppTheme.of(context).color.primaryColor,
                ),
                Option(
                  label: 'Secondary',
                  value: AppTheme.of(context).color.secondTextColor,
                ),
                Option(
                  label: 'Error',
                  value: AppTheme.of(context).color.errorColor,
                ),
              ],
              description: 'The color of the loader.',
            );

            return AppLoaderWidget(
              loadingSize: loadingSize,
              strokeWidth: strokeWidth,
              loadingColor: loadingColor,
            );
          },
        );
}
