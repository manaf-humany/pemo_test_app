import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppErrorWidget] and [OneLineErrorWidget].
///
/// This story allows you to interactively test both error widgets
/// with different inputs for error messages, response types, and actions.
class AppErrorWidgetStory extends Story {
  /// Creates a story for the error widgets.
  AppErrorWidgetStory()
    : super(
        name: 'Widgets/AppErrorWidget',
        builder: (context) {
          final errorMessage = context.knobs.text(
            label: 'Error Message',
            initial: 'Something went wrong. Please try again.',
            description: 'The specific error message to display.',
          );

          final responseType = context.knobs.options(
            label: 'Response Type',
            initial: ResponseType.generalError,
            options:
                ResponseType.values
                    .map((e) => Option(value: e, label: e.toString()))
                    .toList(),
            description: 'The type of error to display.',
          );

          final isOneLine = context.knobs.boolean(
            label: 'One-Line Error',
            initial: false,
            description:
                'Toggle between AppErrorWidget and OneLineErrorWidget.',
          );

          return isOneLine
              ? OneLineErrorWidget(
                errorMessage: errorMessage,
                onRetryPressed: () {},
              )
              : AppErrorWidget(
                errorMessage: errorMessage,
                onRetryPressed: () {},
                responseType: responseType,
              );
        },
      );
}
