import 'package:task_manager/core/utils/exports/exports.dart';

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
          child: SingleChildScrollView(
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
                            _taskController.selectedStatus ?? 'Select',
                        items: _taskController.statusItems,
                        onChanged: _taskController.onStatusChanged,
                        showLabel: false.obs,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.width * 0.55),
                CustomButton(
                  text: 'Create Task',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.back();
                      _taskController.createTask();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
