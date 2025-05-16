import 'package:task_manager/core/utils/exports/exports.dart';

class LoginController extends GetxController {
  var isShowPassIcon = true.obs;
  var isChecked = false.obs;
  var isLoading = false.obs;
  var emailController = TextEditingController();
  var passController = TextEditingController();

  void togglePasswordVisibility() {
    isShowPassIcon.value = !isShowPassIcon.value;
  }

  void toggleRememberCheck() {
    isChecked.value = !isChecked.value;
  }

  void loginProcess() {
    isLoading.value = true;

    Future.delayed(Duration(seconds: 2), () async {
      isLoading.value = false;
      if (Secrets().email == emailController.text &&
          Secrets().pass == passController.text) {
        Get.offAllNamed(AppRouteNames().home);
      } else {
        Get.snackbar(
          'Error',
          'Invalid credentials',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
