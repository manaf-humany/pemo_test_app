import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A platform-adaptive refresh indicator that wraps a scrollable widget.
///
/// This widget provides a pull-to-refresh functionality that adapts its
/// appearance based on the underlying platform (iOS or Android).
class AppRefreshIndicator extends StatelessWidget {
  /// Creates a platform-adaptive refresh indicator.
  ///
  /// The [child] and [onRefresh] arguments must not be null.
  const AppRefreshIndicator({
    required this.child,
    required this.onRefresh,
    super.key,
  });

  /// The widget below this widget in the tree.
  ///
  /// The refresh indicator will be shown when the user pulls down on this widget.
  /// This is typically a [ListView] or other scrollable widget.
  final Widget child;

  /// A function that's called when the user pulls down far enough to trigger a refresh.
  ///
  /// The function must return a [Future] that completes when the refresh operation is over.
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).color;
    return RefreshIndicator.adaptive(
      backgroundColor: Platform.isIOS ? colors.primaryColor : Colors.white,
      color: colors.primaryColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
