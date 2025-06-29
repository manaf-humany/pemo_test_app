import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

typedef AppTextBuilder =
    AppText Function(
      String text, {
      Key? key,
      Color? color,
      int? maxLines,
      FontWeight? fontWeight,
      double? fontSize,
      String? fontFamily,
      TextAlign? align,
      TextDecoration? textDecoration,
      TextOverflow? overflow,
      FontStyle? fontStyle,
      bool selectable,
      String? expandText,
      String? collapseText,
      TextStyle? expandTextStyle,
      double? height,
      double? decorationThickness,
      Color? decorationColor,
      bool? softWrap,
    });

AppTextBuilder _getBuilder(TextStyleType style) {
  switch (style) {
    case TextStyleType.display:
      return AppText.display;
    case TextStyleType.headingLarge:
      return AppText.headingLarge;
    case TextStyleType.headingMedium:
      return AppText.headingMedium;
    case TextStyleType.headingSmall:
      return AppText.headingSmall;
    case TextStyleType.bodyLarge:
      return AppText.bodyLarge;
    case TextStyleType.bodyLargeStrong:
      return AppText.bodyLargeStrong;
    case TextStyleType.bodyMedium:
      return AppText.bodyMedium;
    case TextStyleType.bodyMediumStrong:
      return AppText.bodyMediumStrong;
    case TextStyleType.bodySmall:
      return AppText.bodySmall;
    case TextStyleType.bodySmallStrong:
      return AppText.bodySmallStrong;
    case TextStyleType.bodyTiny:
      return AppText.bodyTiny;
    case TextStyleType.bodyTinyStrong:
      return AppText.bodyTinyStrong;
  }
}

class AppTextsStory extends Story {
  AppTextsStory()
    : super(
        name: 'Widgets/AppText',
        builder: (context) {
          final colors = AppTheme.of(context).color;
          final text = context.knobs.text(
            label: 'Text',
            initial:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          );

          final styleType = context.knobs.options(
            label: 'Text Style',
            initial: TextStyleType.bodyMedium,
            options:
                TextStyleType.values
                    .map(
                      (e) =>
                          Option(label: e.toString().split('.').last, value: e),
                    )
                    .toList(),
          );

          final color = context.knobs.options(
            label: 'Color',
            initial: colors.mainTextColor,
            options: [
              Option(label: 'Main text color', value: colors.mainTextColor),
              Option(label: 'Second text color', value: colors.secondTextColor),
            ],
          );

          final isExpandable = context.knobs.boolean(
            label: 'Is Expandable',
            initial: false,
          );

          final maxLines = context.knobs.sliderInt(
            label: 'Max Lines',
            initial: 2,
            min: 1,
            max: 10,
          );

          final textAlign = context.knobs.options(
            label: 'Text Align',
            initial: TextAlign.start,
            options: const [
              Option(label: 'Start', value: TextAlign.start),
              Option(label: 'End', value: TextAlign.end),
              Option(label: 'Left', value: TextAlign.left),
              Option(label: 'Right', value: TextAlign.right),
              Option(label: 'Center', value: TextAlign.center),
              Option(label: 'Justify', value: TextAlign.justify),
            ],
          );

          final selectable = context.knobs.boolean(
            label: 'Selectable',
            initial: false,
          );

          final builder = _getBuilder(styleType);

          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: builder(
                  text,
                  color: color,
                  maxLines: isExpandable ? null : maxLines,
                  align: textAlign,
                  expandText: isExpandable ? 'Read More' : null,
                  collapseText: isExpandable ? 'Show Less' : null,
                  selectable: selectable,
                ),
              ),
            ),
          );
        },
      );
}
