import 'package:task_manager/core/utils/exports/exports.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var taskList = [].obs;
  var box = Hive.box('myTask');

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    taskList.value = box.values.toList();
  }

  void editItem(BuildContext context, String item) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit tapped on $item')));
  }

  Future<bool> confirmDelete(BuildContext context, String item) async {
    return await showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text('Confirm Delete'),
                content: Text('Are you sure you want to delete "$item"?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Delete'),
                  ),
                ],
              ),
        ) ??
        false;
  }
}
