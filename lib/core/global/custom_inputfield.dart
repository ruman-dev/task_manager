import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/core/utils/colors/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.controller,
    this.width = double.maxFinite,
    this.headerTitle,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.fillColor,
    this.prefixIcon,
    this.formValidator,
    this.suffixWidget,
    this.maxLines,
    this.borderSide,
    this.borderRadius,
    this.hintTextColor,
    this.hintTextFontWeight,
    this.headerTextColor,
    this.textColor,
    this.headerFontWeight,
    this.fontWeight,
    this.prefixIconColor,
    this.isReadOnly,
    this.fontSize,
    this.isObsecure,
    this.inputFormatters,
    this.onTextFieldPressed,
  });

  final TextEditingController? controller;
  final double width;
  final String? headerTitle;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color? fillColor;
  final FormFieldValidator<String>? formValidator;
  final Widget? suffixWidget;
  final int? maxLines;
  final IconData? prefixIcon;
  final BorderSide? borderSide;
  final double? borderRadius;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? headerTextColor;
  final FontWeight? hintTextFontWeight;
  final FontWeight? headerFontWeight;
  final FontWeight? fontWeight;
  final Color? prefixIconColor;
  final bool? isReadOnly;
  final double? fontSize;
  final bool? isObsecure;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTextFieldPressed;

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius != null ? borderRadius! : 12.w,
      ),
      borderSide:
          borderSide != null
              ? borderSide!
              : BorderSide(
                width: 2,
                color: AppColors.primaryColor.withValues(alpha: 0.3),
              ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        color: hintTextColor ?? const Color(0xFF636F85),
        fontSize: fontSize?.sp ?? 16.sp,
        fontWeight: hintTextFontWeight ?? FontWeight.w400,
      ),
      fillColor: fillColor ?? Color(0xFFF8FAFB),
      filled: true,
      border: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      disabledBorder: _outlineInputBorder(),
      errorBorder: _outlineInputBorder(),
      focusedErrorBorder: _outlineInputBorder(),
      suffixIcon: suffixWidget,
      prefixIcon:
          prefixIcon != null
              ? Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(
                  prefixIcon,
                  color: prefixIconColor ?? const Color(0xFF636F85),
                  size: 22.w,
                ),
              )
              : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (headerTitle != null)
            Text(
              headerTitle!,
              style: GoogleFonts.poppins(
                color: headerTextColor ?? AppColors.darkGrey,
                fontSize: 16,
                fontWeight: headerFontWeight ?? FontWeight.w500,
              ),
            ),
          if (headerTitle != null) const SizedBox(height: 8),
          TextFormField(
            readOnly: isReadOnly ?? false,
            maxLines: maxLines ?? 1,
            onTap: onTextFieldPressed,
            inputFormatters: inputFormatters,
            style: GoogleFonts.poppins(
              color: textColor ?? const Color(0xFF636F85),
              fontSize: fontSize ?? 16.sp,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isObsecure ?? false,
            decoration: _inputDecoration(),
            validator: formValidator,
          ),
        ],
      ),
    );
  }
}
