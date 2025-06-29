import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppEmptyWidget].
///
/// This story allows you to interactively test the [AppEmptyWidget]
/// with different inputs for title, content, and image.
class AppEmptyWidgetStory extends Story {
  /// Creates a story for the [AppEmptyWidget].
  AppEmptyWidgetStory()
      : super(
          name: 'Widgets/AppEmptyWidget',
          builder: (context) {
            final title = context.knobs.text(
              label: 'Title',
              initial: 'No Data Found',
              description: 'The main message to display.',
            );

            final content = context.knobs.text(
              label: 'Content',
              initial: 'There is no data to show you right now.',
              description: 'The optional content message.',
            );

            final image = context.knobs.text(
              label: 'Image',
              initial: '',
              description:
                  'The optional image asset path. If empty, a default animation is shown.',
            );

            return AppEmptyWidget(
              title: title,
              content: content.isNotEmpty ? content : null,
              image: image.isNotEmpty ? image : null,
              package: AssetPackageType.root,
            );
          },
        );
}
