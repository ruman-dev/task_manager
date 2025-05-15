import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/global/custom_appbar.dart';
import 'package:task_manager/core/global/custom_button.dart';
import 'package:task_manager/core/global/custom_dropdown.dart';
import 'package:task_manager/core/global/custom_inputfield.dart';
import 'package:task_manager/core/utils/colors/app_colors.dart';
import 'package:task_manager/features/presentation/controllers/create_task_controller.dart';
import 'package:task_manager/features/presentation/controllers/home_controller.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({super.key});

  final _taskController = Get.put(CreateTaskController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Create Task'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputField(
                hintText: 'Task Title',
                controller: _taskController.titleController,
                formValidator:
                    (value) => value!.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 20),
              CustomInputField(
                hintText: 'Task Description',
                maxLines: 10,
                controller: _taskController.descriptionController,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => CustomInputField(
                        isReadOnly: true,
                        hintText: _taskController.formattedDate,
                        hintTextColor: AppColors.darkTextColor,
                        prefixIcon: Icons.calendar_today_outlined,
                        prefixIconColor: AppColors.darkTextColor,
                        onTextFieldPressed:
                            () => _taskController.selectDate(context),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomDropdown(
                      selectedValue:
                          _taskController.selectedStatus ?? 'Type name',
                      items: _taskController.furnitureItems,
                      onChanged: _taskController.onStatusChanged,
                      showLabel: false.obs,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Spacer(),
              CustomButton(
                text: 'Create Task',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _taskController.createTask();
                    Get.find<HomeController>();
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
