import 'package:flutter/material.dart';
import '../theme/roomio_theme.dart';

enum RoomioButtonVariant { primary, secondary, outline, ghost }

class RoomioButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final RoomioButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double height;

  const RoomioButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = RoomioButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    BorderSide border = BorderSide.none;

    switch (variant) {
      case RoomioButtonVariant.primary:
        backgroundColor = RoomioColors.primary;
        textColor = Colors.white;
        break;
      case RoomioButtonVariant.secondary:
        backgroundColor = RoomioColors.navy;
        textColor = Colors.white;
        break;
      case RoomioButtonVariant.outline:
        backgroundColor = Colors.transparent;
        textColor = RoomioColors.navy;
        border = const BorderSide(color: RoomioColors.borderLight, width: 1.5);
        break;
      case RoomioButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        textColor = RoomioColors.textSecondaryLight;
        break;
    }

    final isInteractive = onPressed != null && !isLoading;

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: isInteractive
            ? backgroundColor
            : backgroundColor.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: border,
        ),
        child: InkWell(
          onTap: isInteractive ? onPressed : null,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, size: 18, color: textColor),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        text,
                        style: RoomioTypography.titleMedium.copyWith(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
