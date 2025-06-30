import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A customizable card widget that follows the application's design system.
///
/// The `AppCard` provides a consistent look and feel for card-based UI
/// elements. It can be made tappable and supports custom borders, shadows,
/// and clipping behavior.
class AppCard extends StatelessWidget {
  /// Creates a new `AppCard`.
  const AppCard({
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.shape,
    this.onTap,
    this.shadowColor,
    this.borderSide,
    this.clipBehavior,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The padding around the child.
  ///
  /// Defaults to `EdgeInsets.all(AppSpacing.x4)`.
  final EdgeInsetsGeometry? padding;

  /// The margin around the card.
  ///
  /// Defaults to `EdgeInsets.zero`.
  final EdgeInsetsGeometry? margin;

  /// The color of the card.
  ///
  /// Defaults to `theme.color.surfaceColor`.
  final Color? color;

  /// The elevation of the card.
  ///
  /// Defaults to `2.0`.
  final double? elevation;

  /// The shape of the card.
  ///
  /// If `borderSide` is provided, it will be applied to the shape.
  /// Defaults to a `RoundedRectangleBorder` with a radius of `AppSpacing.x3`.
  final ShapeBorder? shape;

  /// A callback to be executed when the card is tapped.
  ///
  /// If provided, the card will be wrapped in an `InkWell`.
  final VoidCallback? onTap;

  /// The color of the card's shadow.
  final Color? shadowColor;

  /// The border of the card.
  ///
  /// This is a convenience property to add a border without defining a new `shape`.
  final BorderSide? borderSide;

  /// The clip behavior for the card.
  ///
  /// Defaults to `Clip.none`.
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    final effectiveShape = shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.x3),
          side: borderSide ?? BorderSide.none,
        );

    final cardContent = Card(
      elevation: elevation ?? 2.0,
      color: color ?? theme.color.surfaceColor,
      margin: margin ?? EdgeInsets.zero,
      shape: effectiveShape,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior ?? Clip.none,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSpacing.x4),
        child: child,
      ),
    );

    if (onTap != null) {
      final borderRadius = effectiveShape is RoundedRectangleBorder
          ? effectiveShape.borderRadius.resolve(Directionality.of(context))
          : null;

      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: cardContent,
      );
    }

    return cardContent;
  }
}
