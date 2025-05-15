import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/core/utils/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.borderRadius,
    this.textColor,
    this.fontWeight,
    this.height,
    this.fontSize,
    this.borderSide,
  });

  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width ?? screenWidth * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: height?.h ?? 14.h),
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide(color: Colors.transparent, width: 0),
            borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
