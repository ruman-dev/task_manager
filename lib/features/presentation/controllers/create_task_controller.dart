import 'package:intl/intl.dart';
import 'package:task_manager/core/utils/exports/exports.dart';

class CreateTaskController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedStatus = '';
  List<String> statusItems = ['Pending', 'Completed'];
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  String get formattedDate {
    if (selectedDate.value == null) return 'Task Date';
    return DateFormat('dd-MM-yyyy').format(selectedDate.value!);
  }

  void onStatusChanged(String? newValue) {
    selectedStatus = newValue!;
    debugPrint(selectedStatus);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  void createTask() {
    var box = Hive.box('myTask');

    final task = {
      'id': Random().nextInt(1000),
      'title': titleController.text,
      'description': descriptionController.text,
      'date': formattedDate,
      'status': selectedStatus,
    };

    box.add(task);

    final homeController = Get.find<HomeController>();
    homeController.loadTasks();

    Get.snackbar(
      'Task Created',
      'Your task has been created successfully',
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white,
    );

    titleController.clear();
    descriptionController.clear();
    selectedStatus = '';
    selectedDate.value = null;

    debugPrint('Task Created: ${box.values.toList()}');
  }
}
