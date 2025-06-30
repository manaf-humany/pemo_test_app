import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A custom primary app bar with default styling.
///
/// This app bar is designed to provide a consistent look and feel across the app.
/// It features a centered title, no elevation, and a primary background color by default,
/// but these can be overridden.
class AppPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a primary app bar.
  const AppPrimaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle,
    this.elevation,
    this.backgroundColor,
  });

  /// The title of the app bar.
  final String title;

  /// A list of Widgets to display in a row after the [title] widget.
  final List<Widget>? actions;

  /// Whether the title should be centered. Defaults to `true`.
  final bool? centerTitle;

  /// The z-coordinate at which to place this app bar relative to its parent.
  /// Defaults to `0`.
  final double? elevation;

  /// The color to use for the app bar's background.
  /// Defaults to the theme's primary color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText.headingMedium(title),
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      backgroundColor: backgroundColor ?? AppTheme.of(context).color.primaryColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
