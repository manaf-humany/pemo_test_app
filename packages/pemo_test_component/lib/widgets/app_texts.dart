import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

class TextStyleModel {
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

  final TextStyle headingDisplay;
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle headingSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyLargeStrong;
  final TextStyle bodyMedium;
  final TextStyle bodyMediumStrong;
  final TextStyle bodySmall;
  final TextStyle bodySmallStrong;
  final TextStyle bodyTiny;
  final TextStyle bodyTinyStrong;
}

// Add these constructors to your HText class
class AppText extends StatelessWidget {
  ///styleName: display;
  ///font-size: 48;
  ///font-weight: 600;
  ///line-height: 56;
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

  ///styleName: headingLarge;
  ///font-size: 28;
  ///font-weight: 600;
  ///line-height: 32;
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

  ///styleName: headingMedium;
  ///font-size: 20;
  ///font-weight: 600;
  ///line-height: 26;
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

  ///styleName: headingSmall;
  ///font-size: 18;
  ///font-weight: 600;
  ///line-height: 24;
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

  ///styleName: bodyLarge;
  ///font-size: 16;
  ///font-weight: 500;
  ///line-height: 24;
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

  ///styleName: bodyLargeStrong;
  ///font-size: 16;
  ///font-weight: 600;
  ///line-height: 24;
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

  ///styleName: bodyMedium;
  ///font-size: 14;
  ///font-weight: 500;
  ///line-height: 20;
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

  ///styleName: bodyMediumStrong;
  ///font-size: 14;
  ///font-weight: 600;
  ///line-height: 20;
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

  ///styleName: bodySmall;
  ///font-size: 12;
  ///font-weight: 500;
  ///line-height: 16;
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

  ///styleName: bodySmallStrong;
  ///font-size: 12;
  ///font-weight: 600;
  ///line-height: 16;
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

  ///styleName: bodyTiny;
  ///font-size: 10;
  ///font-weight: 500;
  ///line-height: 14;
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

  ///styleName: bodyTinyStrong;
  ///font-size: 10;
  ///font-weight: 600;
  ///line-height: 14;
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

  final String text;
  final TextStyleType styleType;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? align;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final bool selectable;
  final TextOverflow? overflow;
  final double? height;
  final String? expandText;
  final String? collapseText;
  final TextStyle? expandTextStyle;
  final double? decorationThickness;
  final Color? decorationColor;
  final bool? softWrap;

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
      decorationThickness:
          decorationThickness ?? getStyle().decorationThickness,
      decorationColor: decorationColor ?? color ?? getStyle().decorationColor,
      fontStyle: fontStyle ?? getStyle().fontStyle,
      height: height ?? getStyle().height,
    );
    final textAlign = align ?? TextAlign.left;

    final textOverflow =
        maxLines != null ? (overflow ?? TextOverflow.ellipsis) : null;

    if (!selectable) {
      return Text(
        text,
        overflow: textOverflow,
        maxLines: maxLines,
        textAlign: textAlign,
        style: style,
      );
    } else {
      //using selectable area is more preferred than using selectabletext
      return SelectionArea(
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: style,
          overflow: textOverflow,
        ),
      );
    }
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
    this.height,
    this.fontStyle,
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
