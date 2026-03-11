import 'package:flutter/material.dart';
import 'package:warehouse_app/constants/colors.dart';

class OutlineButton extends StatelessWidget {
  final String type;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;

  const OutlineButton({
    this.type = "primary",
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity, // Default: full width
    this.height = 50.0, // Default: tinggi 50px
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(color: _borderColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          foregroundColor: _borderColor,
          backgroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.grey.shade300,
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Color get _borderColor {
    switch (type) {
      case "primary":
        return AppColor.primaryEmerald;
      case "secondary":
        return AppColor.secondarySage;
      case "success":
        return AppColor.success;
      case "warning":
        return AppColor.warning;
      case "error":
        return AppColor.error;
      case "info":
        return AppColor.info;
      default:
        return AppColor.primaryEmerald;
    }
  }
}
