import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story that showcases the `AppCard` widget.
class AppCardStory extends Story {
  AppCardStory()
      : super(
          name: 'Widgets/AppCard',
          builder: (context) {
            final theme = AppTheme.of(context);
            final title = context.knobs.text(
              label: 'Title',
              initial: 'Card Title',
            );
            final content = context.knobs.text(
              label: 'Content',
              initial:
                  'This is the content of the card. You can put any widget here.',
            );
            final elevation = context.knobs.slider(
              label: 'Elevation',
              initial: 2,
              min: 0,
              max: 16,
            );
            final padding = context.knobs.slider(
              label: 'Padding',
              initial: 16,
              min: 0,
              max: 48,
            );
            final margin = context.knobs.slider(
              label: 'Margin',
              initial: 8,
              min: 0,
              max: 48,
            );
            final useOnTap = context.knobs.boolean(
              label: 'Enable onTap',
              initial: true,
            );
            final useBorder = context.knobs.boolean(
              label: 'Enable Border',
              initial: false,
            );
            final useShadowColor = context.knobs.boolean(
              label: 'Use Custom Shadow Color',
              initial: false,
            );
            final clipBehavior = context.knobs.options(
              label: 'Clip Behavior',
              initial: Clip.none,
              options: const [
                Option(label: 'None', value: Clip.none),
                Option(label: 'AntiAlias', value: Clip.antiAlias),
                Option(
                  label: 'AntiAliasWithSaveLayer',
                  value: Clip.antiAliasWithSaveLayer,
                ),
                Option(label: 'HardEdge', value: Clip.hardEdge),
              ],
            );

            return Scaffold(
              body: Center(
                child: AppCard(
                  elevation: elevation,
                  padding: EdgeInsets.all(padding),
                  margin: EdgeInsets.all(margin),
                  clipBehavior: clipBehavior,
                  shadowColor: useShadowColor
                      ? theme.color.primaryColor.withValues(alpha: 0.5)
                      : null,
                  borderSide: useBorder
                      ? BorderSide(color: theme.color.primaryColor, width: 2)
                      : null,
                  onTap: useOnTap
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: AppText.bodyMedium('Card Tapped!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      : null,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingMedium(title),
                      const SizedBox(height: AppSpacing.x2),
                      AppText.bodyLarge(content),
                    ],
                  ),
                ),
              ),
            );
          },
        );
}
