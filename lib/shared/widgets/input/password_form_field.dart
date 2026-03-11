import 'package:flutter/material.dart';
import 'package:warehouse_app/constants/colors.dart';

class AppPasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Color? fillColor;
  final double? fontSize;

  const AppPasswordFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.fillColor = Colors.transparent,
    this.fontSize = 16.0,
  });

  @override
  State<AppPasswordFormField> createState() => _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  // Kondisi untuk menampilkan / menyembunyikan tulisan password
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      maxLines: 1, // Untuk password form, line-nya maksimum 1
      style: TextStyle(fontSize: widget.fontSize),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: widget.fontSize),
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: widget.fontSize),
        prefixIcon: widget.prefixIcon,
        // Suffix icon dinamis berdasarkan kondisi $_obscureText
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColor.gray500,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        // Apply rounded corners using OutlineInputBorder
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColor.gray300, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColor.gray300, width: 1.0),
        ),
        // Customize border colors for different states
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColor.primaryEmerald,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColor.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColor.error, width: 1.5),
        ),
        filled: true, // Adds a background color
        fillColor: widget.fillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
    );
  }
}
