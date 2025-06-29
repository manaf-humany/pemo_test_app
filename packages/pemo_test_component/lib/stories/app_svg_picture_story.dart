import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

enum SvgSource { asset, network }

/// A story for the [AppSvgPicture] widget.
///
/// This story allows you to interactively test the [AppSvgPicture]
/// with different sources, colors, and states.
class AppSvgPictureStory extends Story {
  /// Creates a story for the [AppSvgPicture].
  AppSvgPictureStory()
      : super(
          name: 'Widgets/AppSvgPicture',
          builder: (context) {
            final source = context.knobs.options(
              label: 'Source',
              initial: SvgSource.asset,
              options: const [
                Option(label: 'Asset', value: SvgSource.asset),
                Option(label: 'Network', value: SvgSource.network),
              ],
            );

            final disabled = context.knobs.boolean(
              label: 'Disabled',
              initial: false,
            );

            final colors = AppTheme.of(context).color;

            final color = context.knobs.options<Color?>(
              label: 'Color',
              initial: null,
              options: [
                const Option(label: 'None', value: null),
                Option(label: 'Primary', value: colors.primaryColor),
                Option(label: 'Secondary', value: colors.secondTextColor),
              ],
            );

            final width = context.knobs.slider(
              label: 'Width',
              initial: 100,
              min: 20,
              max: 300,
            );

            final height = context.knobs.slider(
              label: 'Height',
              initial: 100,
              min: 20,
              max: 300,
            );

            final fit = context.knobs.options(
              label: 'BoxFit',
              initial: BoxFit.contain,
              options: const [
                Option(label: 'Contain', value: BoxFit.contain),
                Option(label: 'Cover', value: BoxFit.cover),
                Option(label: 'Fill', value: BoxFit.fill),
                Option(label: 'FitHeight', value: BoxFit.fitHeight),
                Option(label: 'FitWidth', value: BoxFit.fitWidth),
                Option(label: 'None', value: BoxFit.none),
                Option(label: 'ScaleDown', value: BoxFit.scaleDown),
              ],
            );

            Widget svgWidget;
            if (source == SvgSource.asset) {
              svgWidget = AppSvgPicture.asset(
                Assets.svgs.placeHolder,
                width: width,
                height: height,
                fit: fit,
                color: color,
                disabled: disabled,
              );
            } else {
              final url = context.knobs.text(
                label: 'Network URL',
                initial: 'https://www.svgrepo.com/show/530143/plug-cord.svg',
              );
              svgWidget = AppSvgPicture.network(
                url,
                width: width,
                height: height,
                fit: fit,
                color: color,
                disabled: disabled,
              );
            }

            return Center(child: svgWidget);
          },
        );
}
