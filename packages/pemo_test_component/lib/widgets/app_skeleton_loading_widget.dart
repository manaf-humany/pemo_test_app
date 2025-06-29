// import 'package:flutter/material.dart';
// import 'package:pemo_test_component/pemo_test_component.dart';
// import 'package:skeletonizer/skeletonizer.dart' as skeleton;
//
// /// A widget that provides skeleton loading animation for its child widgets.
// ///
// /// This widget wraps the [skeleton.Skeletonizer] package to provide a consistent loading state
// /// appearance across the application. It creates a skeleton loading effect that
// /// mimics the actual content's layout while data is being loaded.
// ///
// /// The widget uses a shimmer effect with configurable base and highlight colors,
// /// defaulting to the theme's blue6 and blue7 colors respectively. The shimmer effect
// /// is applied through [skeleton.ShimmerEffect] with a 1-second duration.
// ///
// /// Example usage:
// /// ```dart
// /// SkeletonLoadingWidget(
// ///   enabled: isLoading,
// ///   child: YourContentWidget(),
// ///   switchAnimationDuration: Duration(milliseconds: 300),
// ///   enableSwitchAnimation: true,
// ///   containersColor: Colors.grey[300]!,
// ///   ignoreContainers: false,
// ///   justifyMultiLineText: true,
// /// )
// /// ```
// class SkeletonLoadingWidget extends StatelessWidget {
//   /// Creates a skeleton loading widget with customizable shimmer effect.
//   ///
//   /// All parameters except [key], [baseColor], and [highlightColor] are required to ensure
//   /// consistent skeleton loading behavior across the application. The colors will default
//   /// to theme values if not provided.
//   const SkeletonLoadingWidget({
//     required this.child,
//     required this.enabled,
//     this.switchAnimationDuration = const Duration(milliseconds: 500),
//     this.enableSwitchAnimation = true,
//     this.containersColor,
//     this.ignoreContainers,
//     this.justifyMultiLineText,
//     this.baseColor,
//     this.highlightColor,
//     super.key,
//   });
//
//   /// The widget to display when not in loading state.
//   /// This will be replaced with a skeleton version when [enabled] is true.
//   final Widget child;
//
//   /// Whether to show the skeleton loading state.
//   /// When true, the child widget will be replaced with a skeleton version.
//   final bool enabled;
//
//   /// Duration for the switch animation between loading and loaded states.
//   /// This controls how quickly the transition happens when [enabled] changes.
//   final Duration switchAnimationDuration;
//
//   /// Whether to animate the transition between loading and loaded states.
//   /// When true, provides a smooth transition between states.
//   final bool enableSwitchAnimation;
//
//   /// The color of container elements in the skeleton state.
//   /// This should be a light color that contrasts well with the background.
//   final Color? containersColor;
//
//   /// Whether to ignore container widgets when creating the skeleton.
//   /// When true, containers will not be converted to skeleton versions.
//   final bool? ignoreContainers;
//
//   /// Whether to justify multi-line text in the skeleton state.
//   /// When true, text lines will be justified to create a more uniform appearance.
//   final bool? justifyMultiLineText;
//
//   /// Optional base color for the shimmer effect.
//   /// If not provided, uses the theme's blue6 color.
//   final Color? baseColor;
//
//   /// Optional highlight color for the shimmer effect.
//   /// If not provided, uses the theme's blue7 color.
//   final Color? highlightColor;
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the theme colors to use as defaults for the shimmer effect
//     var colors = AppTheme.of(context).color;
//
//     // Create the skeleton loading widget with the provided configuration
//     return skeleton.Skeletonizer(
//       // Enable or disable the skeleton loading state
//       enabled: enabled,
//
//       // Configure the switch animation between loading and loaded states
//       switchAnimationConfig: skeleton.SwitchAnimationConfig(
//         duration: switchAnimationDuration,
//       ),
//
//       // Enable or disable the switch animation
//       enableSwitchAnimation: enableSwitchAnimation,
//
//       // Set the color of container elements in the skeleton state
//       containersColor: containersColor,
//
//       // Configure the shimmer effect with theme-aware colors and fixed duration
//       effect: skeleton.ShimmerEffect(
//         // Use the provided base color or default to the theme's blue6 color
//         baseColor: baseColor ?? colors.shimmerBaseColor,
//
//         // Use the provided highlight color or default to the theme's blue7 color
//         highlightColor: highlightColor ?? colors.shimmerHighlightColor,
//
//         // Set the duration of the shimmer effect to 1 second
//         duration: Duration(seconds: 1),
//       ),
//
//       // Ignore container widgets when creating the skeleton
//       ignoreContainers: ignoreContainers,
//
//       // Justify multi-line text in the skeleton state
//       justifyMultiLineText: justifyMultiLineText,
//
//       // Set the border radius of text bones in the skeleton state
//       textBoneBorderRadius: skeleton.TextBoneBorderRadius(
//         BorderRadius.circular(AppBorderWidth.x1),
//       ),
//
//       // The child widget to display when not in loading state
//       child: child,
//     );
//   }
// }
