import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/global/custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.autoLeading,
    this.color,
    this.appBarBottom,
    this.appbarActions,
  });

  final String title;
  final bool? autoLeading;
  final Color? color;
  final PreferredSizeWidget? appBarBottom;
  final List<Widget>? appbarActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: autoLeading ?? true,
      title: CustomText(
        text: title,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF212121),
      ),
      centerTitle: false,
      surfaceTintColor: Colors.white,
      bottom: appBarBottom,
      actions: appbarActions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.06);
}
