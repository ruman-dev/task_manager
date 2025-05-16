import 'package:task_manager/core/utils/exports/exports.dart';

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
          initialRoute: AppRouteNames().login,
          getPages: AppRoutePages.appRoutePages(),
          home: LoginScreen(),
        );
      },
    );
  }
}
