import 'package:flutter/material.dart';
import 'package:warehouse_app/constants/colors.dart';

class IconButtonApp extends StatelessWidget {
  final String type;
  final String? text;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final bool isOutline;

  const IconButtonApp({
    this.type = "primary",
    super.key,
    this.text,
    required this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity, // Default: full width
    this.height = 50.0, // Default: tinggi 50px
    this.padding,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isOutline ? _buildOutlineButton() : _buildElevatedButton(),
    );
  }

  Widget _buildElevatedButton() {
    final style = ElevatedButton.styleFrom(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: _color,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey.shade300,
    );

    if (text == null) {
      return ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Icon(icon, size: 20, color: Colors.white),
      );
    }

    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox.shrink()
          : Icon(icon, size: 20, color: Colors.white),
      label: _buildLabel(Colors.white),
      style: style,
    );
  }

  Widget _buildOutlineButton() {
    final style = OutlinedButton.styleFrom(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      side: BorderSide(color: _color, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      foregroundColor: _color,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.grey.shade300,
    );

    if (text == null) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: _color,
                ),
              )
            : Icon(icon, size: 20, color: _color),
      );
    }

    return OutlinedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox.shrink()
          : Icon(icon, size: 20, color: _color),
      label: _buildLabel(_color),
      style: style,
    );
  }

  Widget _buildLabel(Color loadingColor) {
    if (isLoading) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: loadingColor,
        ),
      );
    }
    return Text(
      text!,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Color get _color {
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

