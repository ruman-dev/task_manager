import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/global/custom_appbar.dart';
import 'package:task_manager/core/global/custom_text.dart';
import 'package:task_manager/core/routes/app_route_names.dart';
import 'package:task_manager/core/utils/colors/app_colors.dart';
import 'package:task_manager/features/presentation/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'My Tasks', autoLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  final taskIndex = _homeController.box.getAt(index);
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFA362EA),
                      border: Border.all(color: Color(0xFFA362EA)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: taskIndex['title'],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  CustomText(
                                    text: taskIndex['description'],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.check,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: taskIndex['date'],
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFD8AFFF),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            CustomText(
                              text:
                                  taskIndex['status'] == 'Completed'
                                      ? 'COMPLETED!'
                                      : 'PENDING',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withValues(alpha: 0.5),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddTaskWidget(),
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(AppRouteNames().createTask),
      backgroundColor: AppColors.primaryColor,
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    );
  }
}
