import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:readmore/readmore.dart';

/// A model that holds the various text styles for the application theme.
class TextStyleModel {
  /// Creates a text style model.
  const TextStyleModel({
    required this.headingDisplay,
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    required this.bodyLarge,
    required this.bodyLargeStrong,
    required this.bodyMedium,
    required this.bodyMediumStrong,
    required this.bodySmall,
    required this.bodySmallStrong,
    required this.bodyTiny,
    required this.bodyTinyStrong,
  });

  /// Style for large, prominent display text.
  final TextStyle headingDisplay;

  /// Style for large headings.
  final TextStyle headingLarge;

  /// Style for medium headings.
  final TextStyle headingMedium;

  /// Style for small headings.
  final TextStyle headingSmall;

  /// Style for large body text.
  final TextStyle bodyLarge;

  /// Style for strong (bold) large body text.
  final TextStyle bodyLargeStrong;

  /// Style for medium body text.
  final TextStyle bodyMedium;

  /// Style for strong (bold) medium body text.
  final TextStyle bodyMediumStrong;

  /// Style for small body text.
  final TextStyle bodySmall;

  /// Style for strong (bold) small body text.
  final TextStyle bodySmallStrong;

  /// Style for tiny body text.
  final TextStyle bodyTiny;

  /// Style for strong (bold) tiny body text.
  final TextStyle bodyTinyStrong;
}

/// A versatile text widget that provides predefined styles from the app's theme.
///
/// Use the named constructors like [AppText.headingLarge], [AppText.bodyMedium], etc.,
/// to apply consistent typography throughout the application.
class AppText extends StatelessWidget {
  /// Displays text with 'display' style (font-size: 48, weight: 600).
  const AppText.display(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.display;

  /// Displays text with 'headingLarge' style (font-size: 28, weight: 600).
  const AppText.headingLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.headingLarge;

  /// Displays text with 'headingMedium' style (font-size: 20, weight: 600).
  const AppText.headingMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.headingMedium;

  /// Displays text with 'headingSmall' style (font-size: 18, weight: 600).
  const AppText.headingSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.headingSmall;

  /// Displays text with 'bodyLarge' style (font-size: 16, weight: 500).
  const AppText.bodyLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodyLarge;

  /// Displays text with 'bodyLargeStrong' style (font-size: 16, weight: 600).
  const AppText.bodyLargeStrong(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodyLargeStrong;

  /// Displays text with 'bodyMedium' style (font-size: 14, weight: 500).
  const AppText.bodyMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodyMedium;

  /// Displays text with 'bodyMediumStrong' style (font-size: 14, weight: 600).
  const AppText.bodyMediumStrong(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodyMediumStrong;

  /// Displays text with 'bodySmall' style (font-size: 12, weight: 500).
  const AppText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodySmall;

  /// Displays text with 'bodySmallStrong' style (font-size: 12, weight: 600).
  const AppText.bodySmallStrong(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodySmallStrong;

  /// Displays text with 'bodyTiny' style (font-size: 10, weight: 500).
  const AppText.bodyTiny(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodyTiny;

  /// Displays text with 'bodyTinyStrong' style (font-size: 10, weight: 600).
  const AppText.bodyTinyStrong(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.selectable = false,
    this.expandText,
    this.collapseText,
    this.expandTextStyle,
    this.height,
    this.decorationThickness,
    this.decorationColor,
    this.softWrap,
  }) : styleType = TextStyleType.bodyTinyStrong;

  /// The text to display.
  final String text;

  /// The predefined style to apply from the theme.
  final TextStyleType styleType;

  /// The color of the text. Overrides the default style color.
  final Color? color;

  /// The font weight of the text. Overrides the default style.
  final FontWeight? fontWeight;

  /// The font family of the text. Overrides the default style.
  final String? fontFamily;

  /// The font size of the text. Overrides the default style.
  final double? fontSize;

  /// How the text should be aligned horizontally.
  final TextAlign? align;

  /// The maximum number of lines for the text to span.
  final int? maxLines;

  /// The decoration to apply to the text (e.g., underline, line-through).
  final TextDecoration? textDecoration;

  /// The font style to apply (e.g., italic).
  final FontStyle? fontStyle;

  /// Whether the text can be selected by the user.
  final bool selectable;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The height of the text, as a multiple of the font size.
  final double? height;

  /// The text to display for the 'read more' link if the text is expandable.
  final String? expandText;

  /// The text to display for the 'show less' link if the text is expandable.
  final String? collapseText;

  /// The text style for the 'read more'/'show less' link.
  final TextStyle? expandTextStyle;

  /// The thickness of the text decoration.
  final double? decorationThickness;

  /// The color of the text decoration.
  final Color? decorationColor;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    TextStyle getBaseStyle() {
      switch (styleType) {
        case TextStyleType.display:
          return theme.text.headingDisplay;
        case TextStyleType.headingLarge:
          return theme.text.headingLarge;
        case TextStyleType.headingMedium:
          return theme.text.headingMedium;
        case TextStyleType.headingSmall:
          return theme.text.headingSmall;
        case TextStyleType.bodyLarge:
          return theme.text.bodyLarge;
        case TextStyleType.bodyLargeStrong:
          return theme.text.bodyLargeStrong;
        case TextStyleType.bodyMedium:
          return theme.text.bodyMedium;
        case TextStyleType.bodyMediumStrong:
          return theme.text.bodyMediumStrong;
        case TextStyleType.bodySmall:
          return theme.text.bodySmall;
        case TextStyleType.bodySmallStrong:
          return theme.text.bodySmallStrong;
        case TextStyleType.bodyTiny:
          return theme.text.bodyTiny;
        case TextStyleType.bodyTinyStrong:
          return theme.text.bodyTinyStrong;
      }
    }

    final baseStyle = getBaseStyle();
    final finalStyle = baseStyle.copyWith(
      color: color ?? baseStyle.color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontSize: fontSize,
      decoration: textDecoration,
      decorationThickness: decorationThickness,
      decorationColor: decorationColor,
      fontStyle: fontStyle,
      height: height,
    );

    if (expandText != null) {
      return ReadMoreText(
        text,
        style: finalStyle,
        trimLines: maxLines ?? 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: expandText!,
        trimExpandedText: collapseText ?? '',
        textAlign: align,
      );
    }

    if (selectable) {
      return SelectableText(
        text,
        style: finalStyle,
        textAlign: align,
        maxLines: maxLines,
      );
    }

    return Text(
      text,
      style: finalStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}

class AppRichText extends StatelessWidget {
  ///styleName: display;
  ///font-size: 48;
  ///font-weight: 600;
  ///line-height: 56;
  const AppRichText.display(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.display;

  ///styleName: headingLarge;
  ///font-size: 28;
  ///font-weight: 600;
  ///line-height: 32;
  const AppRichText.headingLarge(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.headingLarge;

  ///styleName: headingMedium;
  ///font-size: 20;
  ///font-weight: 600;
  ///line-height: 26;
  const AppRichText.headingMedium(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.headingMedium;

  ///styleName: headingSmall;
  ///font-size: 18;
  ///font-weight: 600;
  ///line-height: 24;
  const AppRichText.headingSmall(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.headingSmall;

  ///styleName: bodyLarge;
  ///font-size: 16;
  ///font-weight: 500;
  ///line-height: 24;
  const AppRichText.bodyLarge(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodyLarge;

  ///styleName: bodyLargeStrong;
  ///font-size: 16;
  ///font-weight: 600;
  ///line-height: 24;
  const AppRichText.bodyLargeStrong(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodyLargeStrong;

  ///styleName: bodyMedium;
  ///font-size: 14;
  ///font-weight: 500;
  ///line-height: 20;
  const AppRichText.bodyMedium(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodyMedium;

  ///styleName: bodyMediumStrong;
  ///font-size: 14;
  ///font-weight: 600;
  ///line-height: 20;
  const AppRichText.bodyMediumStrong(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodyMediumStrong;

  ///styleName: bodySmall;
  ///font-size: 12;
  ///font-weight: 500;
  ///line-height: 16;
  const AppRichText.bodySmall(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodySmall;

  ///styleName: bodySmallStrong;
  ///font-size: 12;
  ///font-weight: 600;
  ///line-height: 16;
  const AppRichText.bodySmallStrong(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodySmallStrong;

  ///styleName: bodyTiny;
  ///font-size: 10;
  ///font-weight: 500;
  ///line-height: 14;
  const AppRichText.bodyTiny(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodyTiny;

  ///styleName: bodyTinyStrong;
  ///font-size: 10;
  ///font-weight: 600;
  ///line-height: 14;
  const AppRichText.bodyTinyStrong(
    this.texts, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.height,
  }) : styleType = TextStyleType.bodyTinyStrong;

  @override
  Widget build(BuildContext context) {
    TextStyle getStyle() {
      switch (styleType) {
        case TextStyleType.display:
          return AppTheme.of(context).text.headingDisplay;
        case TextStyleType.headingLarge:
          return AppTheme.of(context).text.headingLarge;
        case TextStyleType.headingMedium:
          return AppTheme.of(context).text.headingMedium;
        case TextStyleType.headingSmall:
          return AppTheme.of(context).text.headingSmall;
        case TextStyleType.bodyLarge:
          return AppTheme.of(context).text.bodyLarge;
        case TextStyleType.bodyLargeStrong:
          return AppTheme.of(context).text.bodyLargeStrong;
        case TextStyleType.bodyMedium:
          return AppTheme.of(context).text.bodyMedium;
        case TextStyleType.bodyMediumStrong:
          return AppTheme.of(context).text.bodyMediumStrong;
        case TextStyleType.bodySmall:
          return AppTheme.of(context).text.bodySmall;
        case TextStyleType.bodySmallStrong:
          return AppTheme.of(context).text.bodySmallStrong;
        case TextStyleType.bodyTiny:
          return AppTheme.of(context).text.bodyTiny;
        case TextStyleType.bodyTinyStrong:
          return AppTheme.of(context).text.bodyTinyStrong;
      }
    }

    final style = getStyle().copyWith(
      color: color ?? getStyle().color,
      fontWeight: fontWeight ?? getStyle().fontWeight,
      fontSize: fontSize ?? getStyle().fontSize,
      fontFamily: fontFamily ?? getStyle().fontFamily,
      decoration: textDecoration ?? getStyle().decoration,
      fontStyle: fontStyle ?? getStyle().fontStyle,
      height: height ?? getStyle().height,
    );
    final textAlign = align ?? TextAlign.left;

    final textOverflow =
        maxLines != null ? (overflow ?? TextOverflow.ellipsis) : null;

    List<TextSpan> getTexts() {
      List<TextSpan> list = [];
      for (var item in texts) {
        list.add(
          TextSpan(text: item.text, style: style.copyWith(color: item.color)),
        );
      }
      return list;
    }

    return RichText(
      text: TextSpan(text: '', children: getTexts()),
      textAlign: textAlign,
      overflow: textOverflow ?? TextOverflow.clip,
      maxLines: maxLines,
    );
  }

  final List<AppSpanText> texts;
  final TextStyleType styleType;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? align;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final double? height;
}

class AppSpanText {
  const AppSpanText({required this.text, required this.color});

  final String text;
  final Color color;
}
