import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A widget to display when there is no data to show.
///
/// This widget is typically used in the center of a screen or a list
/// to inform the user that a particular section is empty.
/// It shows an image or a Lottie animation, a title, and an optional content message.
class AppEmptyWidget extends StatelessWidget {
  /// Creates a widget to display an empty state.
  ///
  /// The [title] is required. The [content] and [image] are optional.
  /// If [image] is not provided, a default Lottie animation is shown.
  const AppEmptyWidget({
    required this.title,
    this.content,
    this.image,
    this.package = AssetPackageType.componentsLibrary,
    super.key,
  });

  /// The main message to display, typically indicating the empty state.
  final String title;

  /// An optional message that provides more details about the empty state.
  final String? content;

  /// The path to an optional image asset to display.
  /// If null, a default Lottie animation is used.
  final String? image;

  /// The package from which to load the asset.
  /// Defaults to `AssetPackageType.componentsLibrary`.
  final AssetPackageType package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: image != null
                  ? Image.asset(
                      image!,
                      package: package.name,
                    )
                  : Lottie.asset(
                      Assets.lottie.noData,
                      package: package.name,
                    ),
            ),
            AppSpacing.h6,
            AppText.headingLarge(title, align: TextAlign.center, maxLines: 2),
            if (content != null) ...[
              AppSpacing.h2,
              AppText.bodyLarge(content!, align: TextAlign.center, maxLines: 3),
            ],
          ],
        ),
      ),
    );
  }
}
