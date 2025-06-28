import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pemo_test_project/core/core.dart';

enum ImageShape { circle, square }

class HNetworkPicture extends StatelessWidget {
  const HNetworkPicture({
    required this.url,
    this.useCache = false,
    this.sizeIcon = 32,
    this.fit = BoxFit.contain,
    this.color,
    this.height,
    this.width,
    this.checkForHttps = true,
    this.shape = ImageShape.square,
    this.placeholderAssetPath,
    this.errorIcon = Icons.broken_image,
    super.key,
  });

  final String url;
  final bool useCache;
  final double sizeIcon;
  final BoxFit fit;
  final Color? color;
  final double? height;
  final double? width;
  final bool checkForHttps;
  final ImageShape shape;
  final String? placeholderAssetPath;
  final IconData errorIcon;

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

  Widget _buildPlaceholder(BuildContext context) {
    return _Wrapper(
      height: height,
      width: width,
      backgroundColor: color, // Renamed for clarity
      child: AppSvgWidget.asset(
        placeholderAssetPath ??
            Assets.svgs.placeHolder, // Use provided or default
        width: sizeIcon,
        height: sizeIcon,
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    final theme = AppTheme.of(context);
    return _Wrapper(
      backgroundColor: color,
      height: height,
      width: width,
      child: Icon(
        errorIcon,
        color: theme.color.whiteColor,
        size: height ?? sizeIcon,
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return _Wrapper(
      backgroundColor: color,
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
          color: color,
          width: width,
          height: height,
          errorWidget: (context, _, __) => _buildErrorWidget(context),
          placeholderFadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 300),
          placeholder: (context, _) => _buildLoadingWidget(context),
        );
      } catch (e, s) {
        log(
          'HNetworkPicture.cache: Failed to initiate CachedNetworkImage for url: $formattedUrl',
          error: e,
          stackTrace: s,
        );
        imageWidget = _buildErrorWidget(context); // Fallback to error widget
      }
    } else {
      imageWidget = Image.network(
        formattedUrl,
        fit: fit,
        color: color,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          log(
            'HNetworkPicture.network: Error loading image for url: $formattedUrl',
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

    if (shape == ImageShape.circle) {
      return ClipOval(child: imageWidget);
    }

    return imageWidget;
  }
}

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
