import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/core/utils/colors/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final double? width;
  final Widget? prefixIcon;
  final String? hintText;
  final String selectedValue;
  final List<String> items;
  final Function(String?) onChanged;
  final RxBool showLabel;
  final TextStyle? textStyle;
  final double? borderWidth;
  final double? borderRadius;
  final Color? backgroundColor;

  const CustomDropdown({
    super.key,
    this.hintText,
    required this.selectedValue,
    this.textStyle,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
    this.width,
    required this.showLabel,
    this.borderWidth,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.4),
              width: borderWidth ?? 1.5.w,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            color: backgroundColor ?? Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
            child: Row(
              children: [
                if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 15.w)],
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                    dropdownColor: Colors.white,
                    value: selectedValue.isNotEmpty ? selectedValue : null,
                    hint: Text(
                      hintText ?? 'Select',
                      style:
                          textStyle ??
                          GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkTextColor,
                          ),
                    ),
                    items:
                        items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  textStyle ??
                                  GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkTextColor,
                                  ),
                            ),
                          );
                        }).toList(),
                    onChanged: onChanged,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xFF718096),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
