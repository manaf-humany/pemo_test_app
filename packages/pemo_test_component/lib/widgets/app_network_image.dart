import 'dart:developer' as developer;
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';

/// A versatile widget for displaying network images with caching, placeholders, and error handling.
///
/// This widget can display images in a circular or square shape and provides
/// options for custom placeholders, error icons, and loading indicators.
class AppNetworkImage extends StatelessWidget {
  /// Creates a network image widget.
  ///
  /// The [url] is required.
  const AppNetworkImage({
    required this.url,
    this.useCache = false,
    this.sizeIcon = 32,
    this.fit = BoxFit.contain,
    this.imageColor,
    this.backgroundColor,
    this.height = AppSpacing.x12,
    this.width = AppSpacing.x12,
    this.checkForHttps = true,
    this.shape = ImageShape.square,
    this.placeholderAssetPath,
    this.errorIcon = Icons.broken_image,
    this.package = AssetPackageType.componentsLibrary,
    super.key,
  });

  /// The URL of the image to display.
  final String url;

  /// Whether to use [CachedNetworkImage] for caching.
  final bool useCache;

  /// The size of the placeholder and error icons.
  final double sizeIcon;

  /// How the image should be inscribed into the box.
  final BoxFit fit;

  /// The color to apply to the image as an overlay.
  final Color? imageColor;

  /// The background color for the placeholder and error widgets.
  final Color? backgroundColor;

  /// The height of the image.
  final double height;

  /// The width of the image.
  final double width;

  /// Whether to automatically prepend "https://" to the URL if it's missing.
  final bool checkForHttps;

  /// The shape of the image.
  final ImageShape shape;

  /// The asset path for a custom placeholder image.
  final String? placeholderAssetPath;

  /// The icon to display when the image fails to load.
  final IconData errorIcon;

  /// The package from which to load the asset.
  /// Defaults to `AssetPackageType.componentsLibrary`.
  final AssetPackageType package;

  /// Returns the formatted URL for the image.
  ///
  /// If [checkForHttps] is true and the URL does not start with "http",
  /// "https://" is prepended to the URL.
  String _getFormattedUrl() {
    if (url.isEmpty) return '';
    if (checkForHttps && !url.startsWith('http')) {
      if (url.startsWith('//')) {
        return 'https:$url';
      }
      return 'https://$url'; // A common default, but might need adjustment
    }
    return url;
  }

  /// Builds the placeholder widget.
  ///
  /// The placeholder is displayed while the image is loading.
  Widget _buildPlaceholder(BuildContext context) {
    return _Wrapper(
      height: height,
      width: width,
      backgroundColor: backgroundColor, // Renamed for clarity
      child: AppSvgPicture.asset(
        placeholderAssetPath ??
            Assets.svgs.placeHolder, // Use provided or default
        width: sizeIcon,
        height: sizeIcon,
        package: package,
      ),
    );
  }

  /// Builds the error widget.
  ///
  /// The error widget is displayed when the image fails to load.
  Widget _buildErrorWidget(BuildContext context) {
    final theme = AppTheme.of(context);
    return _Wrapper(
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      child: Icon(
        errorIcon,
        color: theme.color.whiteColor,
        size: height,
      ),
    );
  }

  /// Builds the loading widget.
  ///
  /// The loading widget is displayed while the image is loading.
  Widget _buildLoadingWidget(BuildContext context) {
    return _Wrapper(
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      child: AppLoaderWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedUrl = _getFormattedUrl();

    if (formattedUrl.isEmpty) {
      return _buildPlaceholder(context);
    }

    Widget imageWidget;

    if (useCache) {
      try {
        imageWidget = CachedNetworkImage(
          imageUrl: formattedUrl,
          fit: fit,
          color: imageColor,
          width: width,
          height: height,
          errorWidget: (context, _, __) => _buildErrorWidget(context),
          placeholderFadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 300),
          placeholder: (context, _) => _buildLoadingWidget(context),
          imageBuilder: (context, imageProvider) {
            if (shape == ImageShape.circle) {
              return CircleAvatar(
                radius: max(width / 2, height / 2),
                backgroundImage: imageProvider,
              );
            } else {
              return Image(
                image: imageProvider,
                fit: fit,
                color: imageColor,
                width: width,
                height: height,
              );
            }
          },
        );
      } catch (e, s) {
        developer.log(
          'AppNetworkImage.cache: Failed to initiate CachedNetworkImage for url: $formattedUrl',
          error: e,
          stackTrace: s,
        );
        imageWidget = _buildErrorWidget(context); // Fallback to error widget
      }
    } else {
      imageWidget = Image.network(
        formattedUrl,
        fit: fit,
        color: imageColor,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          developer.log(
            'AppNetworkImage.network: Error loading image for url: $formattedUrl',
            error: error,
            stackTrace: stackTrace,
          );
          return _buildErrorWidget(context);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingWidget(context);
        },
      );
    }
    return imageWidget;
  }
}

/// A wrapper widget for constraining the size of its child.
///
/// This widget is used to constrain the size of the placeholder, error, and loading widgets.
class _Wrapper extends StatelessWidget {
  const _Wrapper({
    required this.child,
    this.backgroundColor,
    this.height,
    this.width,
  });

  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Using SizedBox to constrain if dimensions are provided,
    // and Center to center the child within those constraints.
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        color: backgroundColor, // Background color for the wrapper itself
        child: Center(
          // Center the actual icon/placeholder/loader
          child: child,
        ),
      ),
    );
  }
}
