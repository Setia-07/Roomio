import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';

/// A robust image widget that loads network photography with smooth fade-in,
/// a loading shimmer/skeleton, and a graceful branded fallback on error.
class LandingImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? overlay;
  final IconData fallbackIcon;

  const LandingImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.overlay,
    this.fallbackIcon = Icons.apartment_rounded,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          child: child,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: RoomioColors.borderLight.withValues(alpha: 0.5),
            borderRadius: borderRadius,
          ),
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  RoomioColors.primary.withValues(alpha: 0.7),
                ),
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                RoomioColors.navy.withValues(alpha: 0.08),
                RoomioColors.primaryContainer.withValues(alpha: 0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Icon(
              fallbackIcon,
              color: RoomioColors.primary.withValues(alpha: 0.5),
              size: 32,
            ),
          ),
        );
      },
    );

    if (overlay != null) {
      content = Stack(
        fit: StackFit.passthrough,
        children: [
          content,
          overlay!,
        ],
      );
    }

    if (borderRadius != null) {
      content = ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }

    return content;
  }
}
