import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/routes/app_route_names.dart';
import 'package:task_manager/core/routes/app_route_pages.dart';
import 'package:task_manager/features/presentation/screens/home_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          initialRoute: AppRouteNames().home,
          getPages: AppRoutePages.appRoutePages(),
          home: HomeScreen(),
        );
      },
    );
  }
}
