import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/global/custom_appbar.dart';
import 'package:task_manager/core/global/custom_button.dart';
import 'package:task_manager/core/global/custom_inputfield.dart';
import 'package:task_manager/core/global/custom_text.dart';
import 'package:task_manager/features/presentation/controllers/create_task_controller.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({super.key});

  // final _taskController = Get.put(CreateTaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Create Task'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInputField(hintText: 'Task Title'),
            SizedBox(height: 20),
            CustomInputField(hintText: 'Task Description'),
            SizedBox(height: 20),
            CustomButton(text: 'Create Task', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
