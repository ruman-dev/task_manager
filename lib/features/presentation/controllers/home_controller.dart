import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var taskList = [].obs;
  var box = Hive.box('myTask');
}
