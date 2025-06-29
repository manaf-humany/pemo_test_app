import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story for the [AppNetworkImage].
///
/// This story allows you to interactively test the [AppNetworkImage]
/// with different properties like URL, shape, and colors.
class AppNetworkImageStory extends Story {
  /// Creates a story for the [AppNetworkImage].
  AppNetworkImageStory()
      : super(
          name: 'Widgets/AppNetworkImage',
          builder: (context) {
            final url = context.knobs.text(
              label: 'Image URL',
              initial: 'https://picsum.photos/200/300',
              description: 'The URL of the image to display.',
            );

            final useCache = context.knobs.boolean(
              label: 'Use Cache',
              initial: true,
              description: 'Whether to use image caching.',
            );

            final shape = context.knobs.options(
              label: 'Shape',
              initial: ImageShape.square,
              options: const [
                Option(label: 'Square', value: ImageShape.square),
                Option(label: 'Circle', value: ImageShape.circle),
              ],
            );

            final fit = context.knobs.options(
              label: 'BoxFit',
              initial: BoxFit.cover,
              options: const [
                Option(label: 'Cover', value: BoxFit.cover),
                Option(label: 'Contain', value: BoxFit.contain),
                Option(label: 'Fill', value: BoxFit.fill),
                Option(label: 'FitHeight', value: BoxFit.fitHeight),
                Option(label: 'FitWidth', value: BoxFit.fitWidth),
                Option(label: 'None', value: BoxFit.none),
                Option(label: 'ScaleDown', value: BoxFit.scaleDown),
              ],
            );

            final width = context.knobs.slider(
              label: 'Width',
              initial: 200,
              min: 50,
              max: 500,
            );

            final height = context.knobs.slider(
              label: 'Height',
              initial: 200,
              min: 50,
              max: 500,
            );

            final colors = AppTheme.of(context).color;

            final imageColor = context.knobs.options<Color?>(
              label: 'Image Color (Overlay)',
              initial: null,
              options: [
                const Option(label: 'None', value: null),
                Option(
                    label: 'Primary with Opacity',
                    value: colors.primaryColor.withOpacity(0.5)),
                Option(
                    label: 'Black with Opacity',
                    value: Colors.black.withOpacity(0.5)),
              ],
            );

            final backgroundColor = context.knobs.options<Color?>(
              label: 'Background Color (Placeholder)',
              initial: colors.greyScaffoldBGColor,
              options: [
                Option(label: 'Grey', value: colors.greyScaffoldBGColor),
                Option(label: 'Primary', value: colors.primaryColor),
                Option(label: 'Transparent', value: Colors.transparent),
              ],
            );

            return Center(
              child: AppNetworkImage(
                url: url,
                useCache: useCache,
                shape: shape,
                fit: fit,
                width: width,
                height: height,
                imageColor: imageColor,
                backgroundColor: backgroundColor,
              ),
            );
          },
        );
}
