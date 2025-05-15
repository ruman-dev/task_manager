import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/routes/app_route_names.dart';
import 'package:task_manager/features/presentation/screens/create_task_screen.dart';
import 'package:task_manager/features/presentation/screens/home_screen.dart';
import 'package:task_manager/features/presentation/screens/login_screen.dart';

class AppRoutePages {
  static List<GetPage<dynamic>> appRoutePages() {
    return [
      _getPage(name: AppRouteNames().login, page: LoginScreen()),
      _getPage(name: AppRouteNames().home, page: HomeScreen()),
      _getPage(name: AppRouteNames().createTask, page: CreateTaskScreen()),
    ];
  }

  static GetPage<dynamic> _getPage({
    required String name,
    required Widget page,
  }) => GetPage(name: name, page: () => page);
}
